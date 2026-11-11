// Uygulama açılış (smoke) testi.
//
// Gerçek MyApp ağacını ayağa kaldırır: Hive geçici bir klasöre kurulur,
// service locator (get_it) başlatılır, kamera/baskı gibi platform
// kanalları mock'lanır ve ana POS ekranının (HomePage) render edildiği
// doğrulanır.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:billing_app/core/bloc/locale_cubit.dart';
import 'package:billing_app/core/data/hive_database.dart';
import 'package:billing_app/core/service_locator.dart' as di;
import 'package:billing_app/features/product/data/models/product_model.dart';
import 'package:billing_app/features/shop/data/models/shop_model.dart';
import 'package:billing_app/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Test ortamında path_provider çalışmadığı için Hive'ı,
    // HiveDatabase.init yerine elle geçici bir klasörle başlatıyoruz.
    final tempDir = await Directory.systemTemp.createTemp('billing_app_test_');
    Hive.init(tempDir.path);
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(ShopModelAdapter());
    await Hive.openBox<ProductModel>(HiveDatabase.productBoxName);
    await Hive.openBox<ShopModel>(HiveDatabase.shopBoxName);
    await Hive.openBox(HiveDatabase.settingsBoxName);

    // Bloc + use case + repository kayıtlarını oluştur.
    await di.init();
  });

  testWidgets('Uygulama hatasız açılır ve ana POS ekranı render edilir',
      (WidgetTester tester) async {
    // mobile_scanner platform kanallarını mock'la; aksi halde test
    // ortamında MissingPluginException fırlatılır.
    const scannerMethodChannel =
        MethodChannel('dev.steenbakker.mobile_scanner/scanner/method');
    const scannerEventChannel =
        MethodChannel('dev.steenbakker.mobile_scanner/scanner/event');

    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      scannerMethodChannel,
      (call) async {
        switch (call.method) {
          case 'state':
            // MobileScannerAuthorizationState.authorized
            return 1;
          case 'start':
            return <String, Object>{
              'textureId': 0,
              'numberOfCameras': 1,
              'currentTorchState': 0,
            };
          default:
            // stop, toggleTorch, updateScanWindow, listen, cancel, ...
            return null;
        }
      },
    );
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      scannerEventChannel,
      (call) async => null,
    );

    await tester.pumpWidget(const MyApp());

    // Yerelleştirme (AppLocalizations) yüklemesi ve bloc'ların ilk
    // durumlarının oturması için birkaç frame pompala.
    await tester.pump();
    await tester.pump();
    await tester.pump();

    // Varsayılan dil Türkçe olduğundan ana ekran Türkçe render edilmelidir.
    expect(find.text('Siparişi Onayla'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Dil İngilizceye çevrilirse arayüz anında güncellenmelidir.
    final localeCubit =
        tester.element(find.byIcon(Icons.settings)).read<LocaleCubit>();
    localeCubit.changeLocale('en');
    await tester.pump();
    await tester.pump();
    expect(find.text('Review Order'), findsOneWidget);
  });
}
