// BillingBloc birim testleri.
//
// ProductRepository arayüzünü bellek içi bir sahte (fake) ile ikame ederek
// sepet mantığını (barkod tarama, adet güncelleme, sepet temizleme) doğrular.

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';

import 'package:billing_app/core/error/failure.dart';
import 'package:billing_app/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:billing_app/features/product/domain/entities/product.dart';
import 'package:billing_app/features/product/domain/repositories/product_repository.dart';
import 'package:billing_app/features/product/domain/usecases/product_usecases.dart';

/// Bellek içi liste ile çalışan sahte ürün deposu.
class FakeProductRepository implements ProductRepository {
  FakeProductRepository(this.products);

  final List<Product> products;

  @override
  Future<Either<Failure, List<Product>>> getProducts() async => Right(products);

  @override
  Future<Either<Failure, Product>> getProductByBarcode(String barcode) async {
    for (final product in products) {
      if (product.barcode == barcode) {
        return Right(product);
      }
    }
    return const Left(CacheFailure('Product not found'));
  }

  @override
  Future<Either<Failure, void>> addProduct(Product product) async {
    products.add(product);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async =>
      const Right(null);

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async =>
      const Right(null);
}

/// Bloc'ların asenkron olay kuyruğunun boşalmasını bekler.
Future<void> flushEventQueue() async {
  for (var i = 0; i < 20; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  const water = Product(
    id: 'p1',
    name: 'Su 0.5L',
    barcode: '8690000000001',
    price: 10.0,
  );
  const bread = Product(
    id: 'p2',
    name: 'Ekmek',
    barcode: '8690000000002',
    price: 7.5,
  );

  late FakeProductRepository repository;
  late BillingBloc bloc;

  setUp(() {
    repository = FakeProductRepository([water, bread]);
    bloc = BillingBloc(
      getProductByBarcodeUseCase: GetProductByBarcodeUseCase(repository),
    );
  });

  tearDown(() => bloc.close());

  test('barkod taranınca ürün sepete eklenir', () async {
    bloc.add(const ScanBarcodeEvent('8690000000001'));
    await flushEventQueue();

    expect(bloc.state.cartItems.length, 1);
    expect(bloc.state.cartItems.first.product.id, 'p1');
    expect(bloc.state.cartItems.first.quantity, 1);
    expect(bloc.state.totalAmount, 10.0);
    expect(bloc.state.error, isNull);
  });

  test('aynı barkod tekrar taranınca adet artar, satır sayısı sabit kalır',
      () async {
    bloc.add(const ScanBarcodeEvent('8690000000001'));
    await flushEventQueue();
    bloc.add(const ScanBarcodeEvent('8690000000001'));
    await flushEventQueue();

    expect(bloc.state.cartItems.length, 1);
    expect(bloc.state.cartItems.first.quantity, 2);
    expect(bloc.state.totalAmount, 20.0);
  });

  test('kayıtlı olmayan barkod tipli hata üretir', () async {
    bloc.add(const ScanBarcodeEvent('000000'));
    await flushEventQueue();

    expect(bloc.state.error, isNotNull);
    expect(bloc.state.error!.type, BillingErrorType.productNotFound);
    expect(bloc.state.error!.barcode, '000000');
    expect(bloc.state.cartItems, isEmpty);
  });

  test('hatalı taramadan sonraki başarılı tarama hatayı temizler', () async {
    bloc.add(const ScanBarcodeEvent('000000'));
    await flushEventQueue();
    expect(bloc.state.error, isNotNull);

    bloc.add(const ScanBarcodeEvent('8690000000002'));
    await flushEventQueue();

    expect(bloc.state.cartItems.length, 1);
    expect(bloc.state.error, isNull);
  });

  test('farklı ürünler taranınca sepet toplamı doğru hesaplanır', () async {
    bloc.add(const ScanBarcodeEvent('8690000000001'));
    await flushEventQueue();
    bloc.add(const ScanBarcodeEvent('8690000000002'));
    await flushEventQueue();

    expect(bloc.state.cartItems.length, 2);
    expect(bloc.state.totalAmount, 17.5);
  });

  test('adet güncellemesi sepetteki ürünün miktarını değiştirir', () async {
    bloc.add(const AddProductToCartEvent(water));
    bloc.add(const UpdateQuantityEvent('p1', 5));
    await flushEventQueue();

    expect(bloc.state.cartItems.first.quantity, 5);
    expect(bloc.state.totalAmount, 50.0);
  });

  test('adet 0 yapılırsa ürün sepetten çıkar', () async {
    bloc.add(const AddProductToCartEvent(water));
    await flushEventQueue();
    bloc.add(const UpdateQuantityEvent('p1', 0));
    await flushEventQueue();

    expect(bloc.state.cartItems, isEmpty);
  });

  test('ürün sepetten elle çıkarılabilir', () async {
    bloc.add(const AddProductToCartEvent(water));
    bloc.add(const AddProductToCartEvent(bread));
    await flushEventQueue();
    bloc.add(const RemoveProductFromCartEvent('p1'));
    await flushEventQueue();

    expect(bloc.state.cartItems.length, 1);
    expect(bloc.state.cartItems.first.product.id, 'p2');
  });

  test('ClearCart sepeti tamamen boşaltır', () async {
    bloc.add(const AddProductToCartEvent(water));
    bloc.add(const AddProductToCartEvent(bread));
    await flushEventQueue();
    bloc.add(ClearCartEvent());
    await flushEventQueue();

    expect(bloc.state.cartItems, isEmpty);
    expect(bloc.state.totalAmount, 0.0);
  });
}
