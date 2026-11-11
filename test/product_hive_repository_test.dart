// ProductRepositoryImpl'in gerçek Hive deposuyla entegrasyonu.
//
// Bu test; Hive adapter üretimi (product_model.g.dart), fpdart Either sözleşmesi
// ve ProductBloc'un uçtan uca veri akışını (ekle -> listele, sil) doğrular.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:billing_app/core/data/hive_database.dart';
import 'package:billing_app/features/product/data/models/product_model.dart';
import 'package:billing_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:billing_app/features/product/domain/entities/product.dart';
import 'package:billing_app/features/product/domain/usecases/product_usecases.dart';
import 'package:billing_app/features/product/presentation/bloc/product_bloc.dart';

Future<void> flushEventQueue() async {
  for (var i = 0; i < 20; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Test ortamında path_provider çalışmadığı için Hive'ı elle,
    // geçici bir klasörle başlatıyoruz.
    final tempDir = await Directory.systemTemp.createTemp('hive_repo_test_');
    Hive.init(tempDir.path);
    Hive.registerAdapter(ProductModelAdapter());
    await Hive.openBox<ProductModel>(HiveDatabase.productBoxName);
  });

  setUp(() async {
    // Her test temiz bir kutu (box) ile başlamalı.
    await HiveDatabase.productBox.clear();
  });

  group('ProductRepositoryImpl (gerçek Hive kutusu)', () {
    const product = Product(
      id: 'p1',
      name: 'Su 0.5L',
      barcode: '8690000000001',
      price: 10.0,
      stock: 5,
    );

    test('ürün eklenip barkod ile geri okunabilir', () async {
      final repository = ProductRepositoryImpl();

      final added = await repository.addProduct(product);
      expect(added.isRight(), isTrue, reason: 'ürün eklenmeli');

      final found = await repository.getProductByBarcode('8690000000001');
      found.fold(
        (failure) => fail('ürün bulunamadı: ${failure.message}'),
        (product) {
          expect(product.id, 'p1');
          expect(product.name, 'Su 0.5L');
          expect(product.price, 10.0);
          expect(product.stock, 5);
        },
      );
    });

    test('olmayan barkod Failure döndürür', () async {
      final repository = ProductRepositoryImpl();

      final found = await repository.getProductByBarcode('yok-boyle-barkod');
      expect(found.isLeft(), isTrue);
    });

    test('güncelleme mevcut kaydın üzerine yazar', () async {
      final repository = ProductRepositoryImpl();

      await repository.addProduct(product);
      const updated = Product(
        id: 'p1',
        name: 'Su 1L',
        barcode: '8690000000001',
        price: 15.0,
        stock: 2,
      );
      final result = await repository.updateProduct(updated);
      expect(result.isRight(), isTrue);

      final all = await repository.getProducts();
      all.fold(
        (failure) => fail('listeleme başarısız: ${failure.message}'),
        (products) {
          expect(products.length, 1);
          expect(products.first.name, 'Su 1L');
          expect(products.first.price, 15.0);
        },
      );
    });

    test('silme ürünü kutudan kaldırır', () async {
      final repository = ProductRepositoryImpl();

      await repository.addProduct(product);
      final deleted = await repository.deleteProduct('p1');
      expect(deleted.isRight(), isTrue);

      final all = await repository.getProducts();
      expect(all.fold((_) => -1, (products) => products.length), 0);
    });
  });

  group('ProductBloc (gerçek repository ile uçtan uca)', () {
    test('ekle/listele/sil akışı çalışır', () async {
      final repository = ProductRepositoryImpl();
      final bloc = ProductBloc(
        getProductsUseCase: GetProductsUseCase(repository),
        addProductUseCase: AddProductUseCase(repository),
        updateProductUseCase: UpdateProductUseCase(repository),
        deleteProductUseCase: DeleteProductUseCase(repository),
      );

      bloc.add(LoadProducts());
      await flushEventQueue();
      expect(bloc.state.status, ProductStatus.loaded);
      expect(bloc.state.products, isEmpty);

      bloc.add(const AddProduct(Product(
        id: 'p1',
        name: 'Su 0.5L',
        barcode: '8690000000001',
        price: 10.0,
        stock: 5,
      )));
      await flushEventQueue();
      expect(bloc.state.status, ProductStatus.loaded);
      expect(bloc.state.lastAction, ProductAction.add);
      expect(bloc.state.products.length, 1);
      expect(bloc.state.products.first.name, 'Su 0.5L');

      bloc.add(const DeleteProduct('p1'));
      await flushEventQueue();
      expect(bloc.state.lastAction, ProductAction.delete);
      expect(bloc.state.products, isEmpty);

      await bloc.close();
    });
  });
}
