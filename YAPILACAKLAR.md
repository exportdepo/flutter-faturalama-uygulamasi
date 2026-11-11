# 📝 YAPILACAKLAR — Yarım Kalan ve Planlanan İşler

Bu dosya, kod tabanında tespit edilmiş **tasarlanmış ama tamamlanmamış** işleri
listeler. Her maddede *mevcut durum* (kanıtlarıyla), *hazır altyapı*,
*yapılması gerekenler* ve *doğrulama ölçütü* belirtilmiştir.

> Not: Bu listedeki tüm yeni metinler `lib/l10n/app_tr.arb` + `app_en.arb`
> içinde l10n anahtarı olarak **hazır** durmaktadır; yeni UI öğeleri doğrudan
> bu anahtarları kullanmalıdır.

## Semboller

| Sembol | Anlam |
|---|---|
| 🟢 | Altyapı (bloc/entity) hazır — sadece UI/kablo eksik |
| 🟡 | Kısmen hazır — bir miktar yeni kod gerekli |
| 🔵 | Sıfırdan implementasyon |
| 💡 | Fikir / opsiyonel iyileştirme |

---

## A. Ödeme Yöntemi Seçimi (Checkout) — 🔵

**Mevcut durum:** Checkout'ta tek bir "Fiş Yazdır" akışı ve pasif bir İBAN
bilgi kutusu var (`l10n.paymentInfo`). Ödeme yöntemi seçimi yok. Upstream
repoda bu akışın Hindistan versiyonu (UPI QR) çalışır durumdaydı; fork İBAN
kutusuyla ikame etti ama ödeme seçimi asla tamamlanmadı.

**Kanıt — hazır duran parçalar:**
- `pubspec.yaml` içinde `pretty_qr_code: ^3.3.0` **tanımlı ama kodda hiç
  kullanılmıyor** (upstream'in QR'u çıkarılırken paket unutulmuş).
- l10n anahtarları: `scanToPay`, `qrCode`, `cashPayment`, `transferPayment`,
  `subtotal`, `tax` — hiçbiri kullanımda değil.
- `ShopModel`: `iban`, `bankName` alanları Hive'da saklanıyor.

**Yapılacaklar:**
1. Checkout'a ödeme yöntemi seçici: **Nakit / Havale-EFT / QR** (segment).
2. **Nakit**: ödenen tutar girişi + para üstü hesabı gösterimi.
3. **Havale/EFT**: İBAN kutusunu vurgula + panoya kopyala butonu (`Clipboard`).
4. **QR**: `pretty_qr_code` ile İBAN + tutar bilgisini gömen ödeme QR kodu
   (Türkiye "Kolay Adres"/karekod içeriğine uygun biçim).
5. **KDV**: Mağaza ayarlarına KDV oranı ekle; fişte ara toplam (`subtotal`),
   KDV (`tax`) ve genel toplam satırları. Yazıcı çıktısına (`printer_helper`)
   da aynı döküm eklensin.

**Doğrulama:** ödeme yöntemi değişince görünen panelin değiştiğini test eden
widget test; toplam/KDV hesabının birim testleri; fiziksel yazıcıda fiş dökümü.

**Tahmini efor:** QR dahil ~1-2 gün | KDV dökümü ayrı ~yarım gün.

---

## B. Yazıcı Yönetim Kontrolleri (Ayarlar > Donanım) — 🟢

**Mevcut durum:** Ayarlar > Donanım bölümünde yalnızca bir **Yenile** ikonu ve
sistem Bluetooth ayarlarına giden ikon var. Cihaz listesi, bağlan/kopma ve
test yazdırma butonları hiç yapılmadı.

**Kanıt — altyapı TAMAMEN hazır:**
- `printer_bloc.dart` içinde kayıtlı ama **hiçbir sayfa tarafından
  tetiklenmeyen** handler'lar: `ScanPrintersEvent` (`_onScan`),
  `ConnectPrinterEvent` (`_onConnect` → MAC'i Hive'a kaydeder),
  `DisconnectPrinterEvent` (`_onDisconnect`), `TestPrintEvent`
  (`_onTestPrint` → "TEST PRINT + mağaza adı" çıktısı basar).
- l10n anahtarları: `printerSettings`, `connectPrinter`, `disconnectPrinter`,
  `printTest`, `printerDisconnected`, `noPrinterFound`, `scanningPrinters`,
  `printSuccess`. Tipli hata kodları (`PrinterErrorCode`) ve l10n eşleyicisi
  (`_printerErrorMessage`) zaten ayarlar sayfasında çalışıyor.

**Yapılacaklar:**
1. Cihaz listesi: Yenile sonrası `state.devices`; tarama sırasında
   "Yazıcılar taranıyor..." (`scanningPrinters`); boş durum için
   `noPrinterFound`.
2. Her satırda **Bağlan** butonu (`ConnectPrinterEvent(mac, name)`);
   bağlı cihaz için **Bağlantıyı Kes** (`DisconnectPrinterEvent`).
3. **Test Yazdır** butonu (`TestPrintEvent(shopName)`) + başarı bildirimi
   (`printSuccess`) + kopma bildirimi (`printerDisconnected`).
4. Bölüm başlığı olarak `printerSettings` ("Yazıcı Ayarları").

**Doğrulama:** sahte `PrinterRepository` ile ayarlar sayfası widget testi
(bağlan → `connected` durumu + rozet); fiziksel cihaz + yazıcıda manuel test.

**Tahmini efor:** ~yarım gün.

---

## C. Stok Takibi (Formlar + Satış Akışı) — 🟢 (form) / 🟡 (satış)

**Mevcut durum:** `Product` entity'si ve Hive modelinde **`stock` alanı var ve
saklanıyor**, ancak `add_product_page` / `edit_product_page` formlarında stok
girişi **yok** (ürün `stock: 0` varsayılanı ile kaydediliyor). Satış sırasında
stok hiç düşülmüyor.

**Kanıt — hazır duran parçalar:** l10n: `stockLabel`, `enterStock`;
`UpdateProductUseCase` / `ProductBloc.updateProduct` stok değişimini uçtan
uca işler.

**Yapılacaklar:**
1. **Stok girişi**: `add_product_page` ve `edit_product_page`'e
   `InputLabel(l10n.stockLabel)` + sayısal TextFormField
   (hint: `l10n.enterStock`); `_submit` içinde `stock` değerini `Product`'a
   geçir.
2. **Ürün listesi kartında** stok göstergesi: "Stokta N"; N ≤ 5 ise
   "Az kaldı" (turuncu), N = 0 ise "Tükendi" (kırmızı) rozeti.
3. **Satışta stok düşürme:** Checkout'ta fiş yazdırma başarılı olduğunda
   sepetteki her ürün için `stock - quantity` güncellemesi (yeni bir use case;
   `PrintReceipt` başarısından sonra tetiklenebilir).

**Doğrulama:** stok düşürme birim testi (satış → `getProducts` teyidi);
form widget testi (stok girilmeden kayıt engellenmeli).

**Tahmini efor:** form ~1-2 saat | rozet ~1 saat | satışta düşme ~yarım gün.

---

## C2. Fiyat Doğrulayıcısının l10n'lu Hâli — 🟡

**Mevcut durum:** `core/utils/app_validators.dart` içindeki `AppValidators.price`
hâlâ **hardcoded İngilizce** döndürüyor: `'Please enter a price'`,
`'Please enter a valid number'`, `'Price cannot be negative'`. (L10n turunda
atlanan tek kullanıcı görürlü sabit budur.)

**Kanıt — hazır duran parçalar:** l10n anahtarları `enterPrice`
("Fiyatı girin"), `invalidPrice` ("Geçersiz fiyat").

**Yapılacaklar:** Validator'ı parametreli hâle getir:

```dart
static String? Function(String?) price({
  required String emptyError,
  required String invalidError,
  required String negativeError,
}) { ... }
```

`add_product_page` / `edit_product_page` çağrılarında l10n metinlerini geçir.
(Negatif durum için yeni bir anahtar eklenebilir: ör. `negativePriceError`.)

**Doğrulama:** `core_utils_test.dart` güncellenir; `flutter analyze` +
`flutter test` yeşil.

**Tahmini efor:** ~30 dakika.

---

## D. Sepet UX Parçaları — 🟢 (Temizle) + 🟡 (bildirim/tooltip)

**Mevcut durum:** Barkod okununca yalnızca **ses + titreşim** var; "ürün
eklendi" bildirimi yok. Sepet yalnızca checkout'a gidip dönünce silinir
(PopScope); kullanıcının **"Sepeti Temizle" butonu yok** (`ClearCartEvent`
bloc'ta kodlu ve çalışıyor ama hiçbir UI tetiklemiyor). Sepet
+/- ikonlarında tooltip/semantics yok.

**Kanıt — hazır duran parçalar:** l10n: `clearCart`, `itemAdded`, `itemRemoved`,
`quantity`, `increase`, `decrease`, `scanProduct`, `cart`.

**Yapılacaklar:**
1. Ana ekranda sepet doluyken **"Sepeti Temizle"** butonu
   (`context.read<BillingBloc>().add(ClearCartEvent())` + `clearCart` metni).
2. Ürün sepete eklendiğinde yeşil kısa bildirim (`itemAdded`), çıkarıldığında
   (`itemRemoved`) — mevcut hata listener'ıyla çakışmaması için ayrı
   `BlocListener` koşulu.
3. Adet ikonlarına `Tooltip`/`Semantics`: `increase` ("Arttır"),
   `decrease` ("Azalt") — erişilebilirlik.
4. 💡 (opsiyonel) **Manuel barkod girişi**: ana ekranda `scanProduct`
   ("Ürün Tara") aksiyonu — barkodu elle yazıp sepete ekleme akışı.

**Doğrulama:** billing_bloc testleri temizleme/bildirim davranışını kapsar;
widget testi buton görünürlüğünü (sepet boşken gizli) doğrular.

**Tahmini efor:** hepsi ~2-3 saat.

---

## E. Bağımlılık Modernizasyonu (Upstream Paritesi) — 🔵 (riskli)

**Mevcut durum:** Upstream (gerçek repo) tüm paketleri güncel majörlere
taşımış durumda; fork geride kalıyor. Migrasyon sonrası da mevcut 26 test +
analyze + CI'nın yeşil kalması şarttır.

| Paket | Fork (şu an) | Upstream (hedef) |
|---|---|---|
| Dart SDK kısıtı | `>=3.1.0 <4.0.0` | `^3.13.7` |
| flutter_bloc | ^8.1.5 | ^9.1.1 |
| go_router | ^14.0.0 | ^18.1.1 |
| mobile_scanner | ^5.1.0 (→5.2.3) | ^7.4.2 |
| equatable | ^2.0.5 | ^3.0.0 |
| get_it | ^7.6.7 | ^9.3.0 |
| permission_handler | ^11.3.1 | ^13.0.2 |
| google_fonts | ^6.1.0 | ^8.2.1 |
| intl | ^0.20.2 | ^0.20.3 |
| cupertino_icons | ^1.0.8 | ^2.0.0 |
| app_settings | ^7.0.0 | ^9.0.1 |
| flutter_lints (dev) | ^3.0.0 | ^6.0.0 |

**Yapılacaklar:**
1. `flutter pub upgrade --major-versions` ile başla.
2. Kod migrasyonu — özellikle `mobile_scanner` 5→7 (kamera API değişiklikleri;
   `test/widget_test.dart`'taki mock kanal adları da değişebilir),
   `go_router` 14→18 (router builder API), `flutter_bloc` 8→9.
3. Tüm doğrulamayı yeniden koş: analyze + test + `flutter build web`.

**Risk notu:** l10n ve tipli hata yapısı korunmalı; tek seferde tek paket
yükselterek ilerlemek önerilir.

**Tahmini efor:** ~yarım gün (en riskli parça mobile_scanner).

---

## F. Küçük / Opsiyonel İşler — 💡

| İş | l10n anahtarı | Açıklama |
|---|---|---|
| Yükleme metni | `loading` ("Yükleniyor...") | Ürün listesi spinner'ına eşlik eden metin |
| Alt navigasyon | `home` ("Anasayfa") | POS/Ürünler/Ayarlar için `BottomNavigationBar` — hızlı geçiş |
| Arama kutusu metni | `search` ("Ara") | "Barkodu tarayın veya girin"e alternatif/ek |
| Diyalog başlığı | `confirmDelete` | Şu an `deleteProductTitle` kullanılıyor; UX değişikliği gerekirse |
| Mağaza kaydet butonu | `updateShopDetails` | Şu an kısa `save` kullanılıyor; daha açıklayıcı istenirse |
| CI web build | — | `flutter-ci.yml`'a `flutter build web` adımı ekleme |
| Veri yedeği | — | Hive verilerini ayarlardan JSON dışa/içe aktarma |
| Atomik satış | — | Satışta stok düşürmeyi tek Hive transaction'ında yapma (C-3 ile birlikte) |

## Anahtar → Madde Eşlemesi

| l10n anahtarı | Madde |
|---|---|
| `scanToPay`, `qrCode`, `cashPayment`, `transferPayment`, `subtotal`, `tax` | A |
| `printerSettings`, `connectPrinter`, `disconnectPrinter`, `printTest`, `printerDisconnected`, `noPrinterFound`, `scanningPrinters`, `printSuccess` | B |
| `stockLabel`, `enterStock`, `saveProduct` | C |
| `enterPrice`, `invalidPrice` | C2 |
| `cart`, `clearCart`, `addToCart`, `itemAdded`, `itemRemoved`, `quantity`, `increase`, `decrease`, `scanProduct` | D |
| `search`, `confirmDelete`, `updateShopDetails`, `language`, `loading`, `home` | F |

---

## ✅ Referans: Tamamlananlar (bu listeye girmeyenler)

- Tarama ses efekti: `SoundService` + `assets/sound/scan.mp3` + audioplayers
  (upstream paritesi tamamlandı).
- Tüm sayfaların l10n'a bağlanması (86 → 122 anahtar; `₹` → `₺` para birimi
  düzeltmesi dahil).
- Bloc katmanı mesajlarının tam yerelleştirilmesi: `BillingError` +
  `BillingErrorType`, `PrinterErrorCode`, `ProductAction` tipli sistem.
- Test altyapısı: 26 test (bloc, Hive entegrasyon, core utils, uygulama
  açılış + dil değişim smoke testi) ve `.github/workflows/flutter-ci.yml`.
- `billing_bloc.dart` "clearError" hatası düzeltmesi; kırık şablon sayaç
  testinin anlamlı smoke testiyle değiştirilmesi.
- README "Projeyi Doğrulama" bölümü ve bu YAPILACAKLAR belgesi.
