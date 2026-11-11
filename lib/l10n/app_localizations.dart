import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'Fatura Uygulaması'**
  String get appTitle;

  /// No description provided for @checkout.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme'**
  String get checkout;

  /// No description provided for @productName.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Adı'**
  String get productName;

  /// No description provided for @price.
  ///
  /// In tr, this message translates to:
  /// **'Fiyat'**
  String get price;

  /// No description provided for @total.
  ///
  /// In tr, this message translates to:
  /// **'Toplam'**
  String get total;

  /// No description provided for @grandTotal.
  ///
  /// In tr, this message translates to:
  /// **'GENEL TOPLAM'**
  String get grandTotal;

  /// No description provided for @scanToPay.
  ///
  /// In tr, this message translates to:
  /// **'QR ile Öde'**
  String get scanToPay;

  /// No description provided for @printReceipt.
  ///
  /// In tr, this message translates to:
  /// **'Fiş Yazdır'**
  String get printReceipt;

  /// No description provided for @printedSuccessfully.
  ///
  /// In tr, this message translates to:
  /// **'Fiş başarıyla yazdırıldı'**
  String get printedSuccessfully;

  /// No description provided for @shopDetailsNotLoaded.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza bilgileri yüklenmedi'**
  String get shopDetailsNotLoaded;

  /// No description provided for @products.
  ///
  /// In tr, this message translates to:
  /// **'Ürünler'**
  String get products;

  /// No description provided for @addProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Ekle'**
  String get addProduct;

  /// No description provided for @editProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Düzenle'**
  String get editProduct;

  /// No description provided for @settings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get settings;

  /// No description provided for @shopDetails.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza Bilgileri'**
  String get shopDetails;

  /// No description provided for @save.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In tr, this message translates to:
  /// **'Düzenle'**
  String get edit;

  /// No description provided for @noProducts.
  ///
  /// In tr, this message translates to:
  /// **'Ürün bulunamadı'**
  String get noProducts;

  /// No description provided for @search.
  ///
  /// In tr, this message translates to:
  /// **'Ara'**
  String get search;

  /// No description provided for @totalItems.
  ///
  /// In tr, this message translates to:
  /// **'toplam ürün'**
  String get totalItems;

  /// No description provided for @productNameLabel.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Adı'**
  String get productNameLabel;

  /// No description provided for @barcodeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Barkod'**
  String get barcodeLabel;

  /// No description provided for @priceLabel.
  ///
  /// In tr, this message translates to:
  /// **'Fiyat'**
  String get priceLabel;

  /// No description provided for @stockLabel.
  ///
  /// In tr, this message translates to:
  /// **'Stok'**
  String get stockLabel;

  /// No description provided for @requiredField.
  ///
  /// In tr, this message translates to:
  /// **'Bu alan zorunludur'**
  String get requiredField;

  /// No description provided for @invalidPrice.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz fiyat'**
  String get invalidPrice;

  /// No description provided for @printSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Yazdırma başarılı'**
  String get printSuccess;

  /// No description provided for @printFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yazdırma başarısız'**
  String get printFailed;

  /// No description provided for @productAdded.
  ///
  /// In tr, this message translates to:
  /// **'Ürün başarıyla eklendi'**
  String get productAdded;

  /// No description provided for @productUpdated.
  ///
  /// In tr, this message translates to:
  /// **'Ürün başarıyla güncellendi'**
  String get productUpdated;

  /// No description provided for @productDeleted.
  ///
  /// In tr, this message translates to:
  /// **'Ürün başarıyla silindi'**
  String get productDeleted;

  /// No description provided for @enterProductName.
  ///
  /// In tr, this message translates to:
  /// **'Ürün adını girin'**
  String get enterProductName;

  /// No description provided for @enterBarcode.
  ///
  /// In tr, this message translates to:
  /// **'Barkod numarasını girin'**
  String get enterBarcode;

  /// No description provided for @enterPrice.
  ///
  /// In tr, this message translates to:
  /// **'Fiyatı girin'**
  String get enterPrice;

  /// No description provided for @enterStock.
  ///
  /// In tr, this message translates to:
  /// **'Stok miktarını girin'**
  String get enterStock;

  /// No description provided for @saveProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürünü Kaydet'**
  String get saveProduct;

  /// No description provided for @updateProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürünü Güncelle'**
  String get updateProduct;

  /// No description provided for @deleteProductConfirm.
  ///
  /// In tr, this message translates to:
  /// **'\"{name}\" adlı ürünü silmek istediğinize emin misiniz?'**
  String deleteProductConfirm(String name);

  /// No description provided for @confirmDelete.
  ///
  /// In tr, this message translates to:
  /// **'Silmeyi Onayla'**
  String get confirmDelete;

  /// No description provided for @shopName.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza Adı'**
  String get shopName;

  /// No description provided for @shopAddress.
  ///
  /// In tr, this message translates to:
  /// **'Adres'**
  String get shopAddress;

  /// No description provided for @phoneNumber.
  ///
  /// In tr, this message translates to:
  /// **'Telefon Numarası'**
  String get phoneNumber;

  /// No description provided for @footerText.
  ///
  /// In tr, this message translates to:
  /// **'Fiş Alt Metni'**
  String get footerText;

  /// No description provided for @maxLengthHint.
  ///
  /// In tr, this message translates to:
  /// **'En fazla {count}'**
  String maxLengthHint(int count);

  /// No description provided for @iban.
  ///
  /// In tr, this message translates to:
  /// **'IBAN'**
  String get iban;

  /// No description provided for @bankName.
  ///
  /// In tr, this message translates to:
  /// **'Banka Adı'**
  String get bankName;

  /// No description provided for @enterShopName.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza adını girin'**
  String get enterShopName;

  /// No description provided for @enterAddress.
  ///
  /// In tr, this message translates to:
  /// **'Adresi girin'**
  String get enterAddress;

  /// No description provided for @enterPhone.
  ///
  /// In tr, this message translates to:
  /// **'Telefon numarasını girin'**
  String get enterPhone;

  /// No description provided for @enterIban.
  ///
  /// In tr, this message translates to:
  /// **'IBAN numarasını girin'**
  String get enterIban;

  /// No description provided for @enterBankName.
  ///
  /// In tr, this message translates to:
  /// **'Banka adını girin'**
  String get enterBankName;

  /// No description provided for @enterFooterText.
  ///
  /// In tr, this message translates to:
  /// **'Fiş alt metnini girin'**
  String get enterFooterText;

  /// No description provided for @updateShopDetails.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza Bilgilerini Güncelle'**
  String get updateShopDetails;

  /// No description provided for @printerSettings.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı Ayarları'**
  String get printerSettings;

  /// No description provided for @connectPrinter.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcıya Bağlan'**
  String get connectPrinter;

  /// No description provided for @disconnectPrinter.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcıyı Bağlantıyı Kes'**
  String get disconnectPrinter;

  /// No description provided for @printTest.
  ///
  /// In tr, this message translates to:
  /// **'Test Yazdır'**
  String get printTest;

  /// No description provided for @printerConnected.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı bağlandı'**
  String get printerConnected;

  /// No description provided for @printerDisconnected.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı bağlantısı kesildi'**
  String get printerDisconnected;

  /// No description provided for @noPrinterFound.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı bulunamadı'**
  String get noPrinterFound;

  /// No description provided for @scanningPrinters.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcılar taranıyor...'**
  String get scanningPrinters;

  /// No description provided for @scanProduct.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Tara'**
  String get scanProduct;

  /// No description provided for @addToCart.
  ///
  /// In tr, this message translates to:
  /// **'Sepete Ekle'**
  String get addToCart;

  /// No description provided for @cart.
  ///
  /// In tr, this message translates to:
  /// **'Sepet'**
  String get cart;

  /// No description provided for @clearCart.
  ///
  /// In tr, this message translates to:
  /// **'Sepeti Temizle'**
  String get clearCart;

  /// No description provided for @itemAdded.
  ///
  /// In tr, this message translates to:
  /// **'Ürün sepete eklendi'**
  String get itemAdded;

  /// No description provided for @itemRemoved.
  ///
  /// In tr, this message translates to:
  /// **'Ürün sepetten çıkarıldı'**
  String get itemRemoved;

  /// No description provided for @quantity.
  ///
  /// In tr, this message translates to:
  /// **'Adet'**
  String get quantity;

  /// No description provided for @increase.
  ///
  /// In tr, this message translates to:
  /// **'Arttır'**
  String get increase;

  /// No description provided for @decrease.
  ///
  /// In tr, this message translates to:
  /// **'Azalt'**
  String get decrease;

  /// No description provided for @emptyCart.
  ///
  /// In tr, this message translates to:
  /// **'Sepet boş'**
  String get emptyCart;

  /// No description provided for @subtotal.
  ///
  /// In tr, this message translates to:
  /// **'Ara Toplam'**
  String get subtotal;

  /// No description provided for @tax.
  ///
  /// In tr, this message translates to:
  /// **'KDV'**
  String get tax;

  /// No description provided for @language.
  ///
  /// In tr, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @turkish.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get turkish;

  /// No description provided for @english.
  ///
  /// In tr, this message translates to:
  /// **'İngilizce'**
  String get english;

  /// No description provided for @productNotFound.
  ///
  /// In tr, this message translates to:
  /// **'Ürün bulunamadı: {barcode}'**
  String productNotFound(String barcode);

  /// No description provided for @error.
  ///
  /// In tr, this message translates to:
  /// **'Hata'**
  String get error;

  /// No description provided for @success.
  ///
  /// In tr, this message translates to:
  /// **'Başarılı'**
  String get success;

  /// No description provided for @loading.
  ///
  /// In tr, this message translates to:
  /// **'Yükleniyor...'**
  String get loading;

  /// No description provided for @home.
  ///
  /// In tr, this message translates to:
  /// **'Anasayfa'**
  String get home;

  /// No description provided for @paymentInfo.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme Bilgileri'**
  String get paymentInfo;

  /// No description provided for @cashPayment.
  ///
  /// In tr, this message translates to:
  /// **'Nakit Ödeme'**
  String get cashPayment;

  /// No description provided for @transferPayment.
  ///
  /// In tr, this message translates to:
  /// **'Havale/EFT'**
  String get transferPayment;

  /// No description provided for @qrCode.
  ///
  /// In tr, this message translates to:
  /// **'QR Kod'**
  String get qrCode;

  /// No description provided for @reviewOrder.
  ///
  /// In tr, this message translates to:
  /// **'Siparişi Onayla'**
  String get reviewOrder;

  /// No description provided for @turnOnCamera.
  ///
  /// In tr, this message translates to:
  /// **'Kamerayı Aç'**
  String get turnOnCamera;

  /// No description provided for @cameraOffHint.
  ///
  /// In tr, this message translates to:
  /// **'Barkodları otomatik olarak taramak için kameranızı açın.'**
  String get cameraOffHint;

  /// No description provided for @cameraOffTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kamera kapalı'**
  String get cameraOffTitle;

  /// No description provided for @scannedItems.
  ///
  /// In tr, this message translates to:
  /// **'Okunan Ürünler'**
  String get scannedItems;

  /// No description provided for @totalItemsCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} ürün toplam'**
  String totalItemsCount(int count);

  /// No description provided for @totalPrice.
  ///
  /// In tr, this message translates to:
  /// **'TOPLAM TUTAR'**
  String get totalPrice;

  /// No description provided for @emptyCartHint.
  ///
  /// In tr, this message translates to:
  /// **'Yukarıdaki kamerayla tarattığınız ürünler burada görünecek.'**
  String get emptyCartHint;

  /// No description provided for @scanBarcode.
  ///
  /// In tr, this message translates to:
  /// **'Barkod Tara'**
  String get scanBarcode;

  /// No description provided for @alignBarcodeHint.
  ///
  /// In tr, this message translates to:
  /// **'Barkodu çerçeve içine hizalayın'**
  String get alignBarcodeHint;

  /// No description provided for @productManagement.
  ///
  /// In tr, this message translates to:
  /// **'Ürün Yönetimi'**
  String get productManagement;

  /// No description provided for @scanOrEnterBarcode.
  ///
  /// In tr, this message translates to:
  /// **'Barkodu tarayın veya girin'**
  String get scanOrEnterBarcode;

  /// No description provided for @tapToScanHint.
  ///
  /// In tr, this message translates to:
  /// **'Kamera tarayıcısını açmak için simgeye dokunun'**
  String get tapToScanHint;

  /// No description provided for @barcodeExists.
  ///
  /// In tr, this message translates to:
  /// **'\"{barcode}\" barkodlu ürün zaten mevcut!'**
  String barcodeExists(String barcode);

  /// No description provided for @exampleProductName.
  ///
  /// In tr, this message translates to:
  /// **'ör. Ayçiçek Yağı 1L'**
  String get exampleProductName;

  /// No description provided for @deleteProductTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ürünü Sil'**
  String get deleteProductTitle;

  /// No description provided for @noProductsMatch.
  ///
  /// In tr, this message translates to:
  /// **'Aramanızla eşleşen ürün yok.'**
  String get noProductsMatch;

  /// No description provided for @errorWithMessage.
  ///
  /// In tr, this message translates to:
  /// **'Hata: {message}'**
  String errorWithMessage(String message);

  /// No description provided for @sectionManagement.
  ///
  /// In tr, this message translates to:
  /// **'YÖNETİM'**
  String get sectionManagement;

  /// No description provided for @sectionLanguage.
  ///
  /// In tr, this message translates to:
  /// **'DİL'**
  String get sectionLanguage;

  /// No description provided for @sectionHardware.
  ///
  /// In tr, this message translates to:
  /// **'DONANIM'**
  String get sectionHardware;

  /// No description provided for @manageStockSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Stok ve barkodları yönetin'**
  String get manageStockSubtitle;

  /// No description provided for @businessInfoSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'İşletme bilgilerini ve adresi düzenleyin'**
  String get businessInfoSubtitle;

  /// No description provided for @selectAppLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama dilini seçin'**
  String get selectAppLanguage;

  /// No description provided for @printDevice.
  ///
  /// In tr, this message translates to:
  /// **'Yazdırma Cihazı'**
  String get printDevice;

  /// No description provided for @noPrinterConnected.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı bağlı değil'**
  String get noPrinterConnected;

  /// No description provided for @connected.
  ///
  /// In tr, this message translates to:
  /// **'BAĞLI'**
  String get connected;

  /// No description provided for @pairPrinterHint.
  ///
  /// In tr, this message translates to:
  /// **'Yeni bir cihaz bağlamak için telefonunuzun Bluetooth ayarlarından eşleştirme yapın, ardından dönüp Yenile\'ye dokunun.'**
  String get pairPrinterHint;

  /// No description provided for @printerAutoConnectFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcıya otomatik bağlanılamadı!'**
  String get printerAutoConnectFailed;

  /// No description provided for @printerNotConfigured.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcı bağlı değil ve kayıtlı yazıcı bulunamadı!'**
  String get printerNotConfigured;

  /// No description provided for @printFailedWithMessage.
  ///
  /// In tr, this message translates to:
  /// **'Yazdırma başarısız: {message}'**
  String printFailedWithMessage(String message);

  /// No description provided for @noPairedDevices.
  ///
  /// In tr, this message translates to:
  /// **'Eşleştirilmiş cihaz bulunamadı.'**
  String get noPairedDevices;

  /// No description provided for @couldNotConnectPrinterAny.
  ///
  /// In tr, this message translates to:
  /// **'Eşleştirilmiş hiçbir cihaza bağlanılamadı.'**
  String get couldNotConnectPrinterAny;

  /// No description provided for @printerConnectFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yazıcıya bağlanılamadı.'**
  String get printerConnectFailed;

  /// No description provided for @scanFailedWithMessage.
  ///
  /// In tr, this message translates to:
  /// **'Tarama başarısız: {message}'**
  String scanFailedWithMessage(String message);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
