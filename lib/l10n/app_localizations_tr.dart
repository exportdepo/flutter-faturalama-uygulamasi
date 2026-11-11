// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Fatura Uygulaması';

  @override
  String get checkout => 'Ödeme';

  @override
  String get productName => 'Ürün Adı';

  @override
  String get price => 'Fiyat';

  @override
  String get total => 'Toplam';

  @override
  String get grandTotal => 'GENEL TOPLAM';

  @override
  String get scanToPay => 'QR ile Öde';

  @override
  String get printReceipt => 'Fiş Yazdır';

  @override
  String get printedSuccessfully => 'Fiş başarıyla yazdırıldı';

  @override
  String get shopDetailsNotLoaded => 'Mağaza bilgileri yüklenmedi';

  @override
  String get products => 'Ürünler';

  @override
  String get addProduct => 'Ürün Ekle';

  @override
  String get editProduct => 'Ürün Düzenle';

  @override
  String get settings => 'Ayarlar';

  @override
  String get shopDetails => 'Mağaza Bilgileri';

  @override
  String get save => 'Kaydet';

  @override
  String get cancel => 'İptal';

  @override
  String get delete => 'Sil';

  @override
  String get edit => 'Düzenle';

  @override
  String get noProducts => 'Ürün bulunamadı';

  @override
  String get search => 'Ara';

  @override
  String get totalItems => 'toplam ürün';

  @override
  String get productNameLabel => 'Ürün Adı';

  @override
  String get barcodeLabel => 'Barkod';

  @override
  String get priceLabel => 'Fiyat';

  @override
  String get stockLabel => 'Stok';

  @override
  String get requiredField => 'Bu alan zorunludur';

  @override
  String get invalidPrice => 'Geçersiz fiyat';

  @override
  String get printSuccess => 'Yazdırma başarılı';

  @override
  String get printFailed => 'Yazdırma başarısız';

  @override
  String get productAdded => 'Ürün başarıyla eklendi';

  @override
  String get productUpdated => 'Ürün başarıyla güncellendi';

  @override
  String get productDeleted => 'Ürün başarıyla silindi';

  @override
  String get enterProductName => 'Ürün adını girin';

  @override
  String get enterBarcode => 'Barkod numarasını girin';

  @override
  String get enterPrice => 'Fiyatı girin';

  @override
  String get enterStock => 'Stok miktarını girin';

  @override
  String get saveProduct => 'Ürünü Kaydet';

  @override
  String get updateProduct => 'Ürünü Güncelle';

  @override
  String deleteProductConfirm(String name) {
    return '\"$name\" adlı ürünü silmek istediğinize emin misiniz?';
  }

  @override
  String get confirmDelete => 'Silmeyi Onayla';

  @override
  String get shopName => 'Mağaza Adı';

  @override
  String get shopAddress => 'Adres';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get footerText => 'Fiş Alt Metni';

  @override
  String maxLengthHint(int count) {
    return 'En fazla $count';
  }

  @override
  String get iban => 'IBAN';

  @override
  String get bankName => 'Banka Adı';

  @override
  String get enterShopName => 'Mağaza adını girin';

  @override
  String get enterAddress => 'Adresi girin';

  @override
  String get enterPhone => 'Telefon numarasını girin';

  @override
  String get enterIban => 'IBAN numarasını girin';

  @override
  String get enterBankName => 'Banka adını girin';

  @override
  String get enterFooterText => 'Fiş alt metnini girin';

  @override
  String get updateShopDetails => 'Mağaza Bilgilerini Güncelle';

  @override
  String get printerSettings => 'Yazıcı Ayarları';

  @override
  String get connectPrinter => 'Yazıcıya Bağlan';

  @override
  String get disconnectPrinter => 'Yazıcıyı Bağlantıyı Kes';

  @override
  String get printTest => 'Test Yazdır';

  @override
  String get printerConnected => 'Yazıcı bağlandı';

  @override
  String get printerDisconnected => 'Yazıcı bağlantısı kesildi';

  @override
  String get noPrinterFound => 'Yazıcı bulunamadı';

  @override
  String get scanningPrinters => 'Yazıcılar taranıyor...';

  @override
  String get scanProduct => 'Ürün Tara';

  @override
  String get addToCart => 'Sepete Ekle';

  @override
  String get cart => 'Sepet';

  @override
  String get clearCart => 'Sepeti Temizle';

  @override
  String get itemAdded => 'Ürün sepete eklendi';

  @override
  String get itemRemoved => 'Ürün sepetten çıkarıldı';

  @override
  String get quantity => 'Adet';

  @override
  String get increase => 'Arttır';

  @override
  String get decrease => 'Azalt';

  @override
  String get emptyCart => 'Sepet boş';

  @override
  String get subtotal => 'Ara Toplam';

  @override
  String get tax => 'KDV';

  @override
  String get language => 'Dil';

  @override
  String get turkish => 'Türkçe';

  @override
  String get english => 'İngilizce';

  @override
  String productNotFound(String barcode) {
    return 'Ürün bulunamadı: $barcode';
  }

  @override
  String get error => 'Hata';

  @override
  String get success => 'Başarılı';

  @override
  String get loading => 'Yükleniyor...';

  @override
  String get home => 'Anasayfa';

  @override
  String get paymentInfo => 'Ödeme Bilgileri';

  @override
  String get cashPayment => 'Nakit Ödeme';

  @override
  String get transferPayment => 'Havale/EFT';

  @override
  String get qrCode => 'QR Kod';

  @override
  String get reviewOrder => 'Siparişi Onayla';

  @override
  String get turnOnCamera => 'Kamerayı Aç';

  @override
  String get cameraOffHint =>
      'Barkodları otomatik olarak taramak için kameranızı açın.';

  @override
  String get cameraOffTitle => 'Kamera kapalı';

  @override
  String get scannedItems => 'Okunan Ürünler';

  @override
  String totalItemsCount(int count) {
    return '$count ürün toplam';
  }

  @override
  String get totalPrice => 'TOPLAM TUTAR';

  @override
  String get emptyCartHint =>
      'Yukarıdaki kamerayla tarattığınız ürünler burada görünecek.';

  @override
  String get scanBarcode => 'Barkod Tara';

  @override
  String get alignBarcodeHint => 'Barkodu çerçeve içine hizalayın';

  @override
  String get productManagement => 'Ürün Yönetimi';

  @override
  String get scanOrEnterBarcode => 'Barkodu tarayın veya girin';

  @override
  String get tapToScanHint => 'Kamera tarayıcısını açmak için simgeye dokunun';

  @override
  String barcodeExists(String barcode) {
    return '\"$barcode\" barkodlu ürün zaten mevcut!';
  }

  @override
  String get exampleProductName => 'ör. Ayçiçek Yağı 1L';

  @override
  String get deleteProductTitle => 'Ürünü Sil';

  @override
  String get noProductsMatch => 'Aramanızla eşleşen ürün yok.';

  @override
  String errorWithMessage(String message) {
    return 'Hata: $message';
  }

  @override
  String get sectionManagement => 'YÖNETİM';

  @override
  String get sectionLanguage => 'DİL';

  @override
  String get sectionHardware => 'DONANIM';

  @override
  String get manageStockSubtitle => 'Stok ve barkodları yönetin';

  @override
  String get businessInfoSubtitle => 'İşletme bilgilerini ve adresi düzenleyin';

  @override
  String get selectAppLanguage => 'Uygulama dilini seçin';

  @override
  String get printDevice => 'Yazdırma Cihazı';

  @override
  String get noPrinterConnected => 'Yazıcı bağlı değil';

  @override
  String get connected => 'BAĞLI';

  @override
  String get pairPrinterHint =>
      'Yeni bir cihaz bağlamak için telefonunuzun Bluetooth ayarlarından eşleştirme yapın, ardından dönüp Yenile\'ye dokunun.';

  @override
  String get printerAutoConnectFailed => 'Yazıcıya otomatik bağlanılamadı!';

  @override
  String get printerNotConfigured =>
      'Yazıcı bağlı değil ve kayıtlı yazıcı bulunamadı!';

  @override
  String printFailedWithMessage(String message) {
    return 'Yazdırma başarısız: $message';
  }

  @override
  String get noPairedDevices => 'Eşleştirilmiş cihaz bulunamadı.';

  @override
  String get couldNotConnectPrinterAny =>
      'Eşleştirilmiş hiçbir cihaza bağlanılamadı.';

  @override
  String get printerConnectFailed => 'Yazıcıya bağlanılamadı.';

  @override
  String scanFailedWithMessage(String message) {
    return 'Tarama başarısız: $message';
  }
}
