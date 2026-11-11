# 🛒 Flutter Faturalama Uygulaması (Mobile POS & Billing App)

Yüksek performanslı, çevrimdışı öncelikli (offline-first) bir faturalama ve Satış Noktası (POS) uygulaması. Barkod tarama, Bluetooth termal yazıcı entegrasyonu ve güçlü yerel veri saklama özellikleriyle modern perakende operasyonları için tasarlandı.

## 📺 Demo & Screenshot

https://github.com/user-attachments/assets/f2d16454-5408-43b3-b207-cd843bbc2c9e

---

## 🎯 Proje Kapsamı (Project Scope)

Bu uygulama, küçük ve orta ölçekli perakende mağazaları için tam teşekküllü bir çevrimdışı POS sistemi olarak hizmet eder. Ödeme süreçlerini, katalog yönetimini ve makbuz oluşturma işlemlerini tamamen cihaz üzerinde güvenli bir şekilde optimize eder.

### Temel Özellikler:
- **🌍 Tam Yerelleştirme**: Türkçe ve İngilizce dil desteği, yerel para birimi (TL) ve tarih formatları.
- **📦 Ürün Yönetim Sistemi**: Barkod/QR kod destekli envanter öğeleri için tam CRUD işlemleri.
- **🛒 Akıllı Ödeme Sistemi**: Kamera tabanlı barkod tarama veya manuel giriş ile hızlı sepet oluşturma.
- **🔊 Tarama Ses Efekti**: Barkod algılandığında `audioplayers` ile sesli geri bildirim (`assets/sound/scan.mp3`).
- **🖨️ Bluetooth Termal Yazdırma**: `print_bluetooth_thermal` entegrasyonu ile anlık fiziksel makbuz çıktısı.
- **⚙️ Mağaza Ayarları**: Makbuzlar üzerinde dinamik olarak görünen özelleştirilebilir işletme detayları.
- **📶 Çevrimdışı Öncelikli Mimari**: Yıldırım hızında NoSQL veri depolama için `Hive` kullanımı. İnternet bağlantısı gerektirmez.

---

## 🛠 Teknik Yığın ve Mimari (Tech Stack)

Uygulama; ölçeklenebilirlik ve test edilebilirliği sağlamak amacıyla **Clean Architecture** ve **Feature-Driven Design** prensipleriyle geliştirilmiştir.

- **Framework**: [Flutter](https://flutter.dev/) (SDK >=3.1.0)
- **State Management**: `flutter_bloc` (Cubit)
- **Dependency Injection**: `get_it`
- **Routing**: `go_router`
- **Local Database**: `hive` & `hive_flutter`
- **Functional Programming**: `fpdart` (Either pattern ile hata yönetimi)
- **Hardware Integrations**: `mobile_scanner`, `print_bluetooth_thermal`
- **Ses Geri Bildirimi**: `audioplayers` (varlık tabanlı tarama sesi)

---

## 📁 Dosya Yapısı (File Structure)

Kod tabanı, özellik odaklı (Feature-First) bir yapıda organize edilmiştir:

```text
lib/
├── core/                       # Çekirdek yardımcılar ve paylaşılan bileşenler
│   ├── utils/                  # Yazıcı yardımcıları (PrinterHelper), formatlayıcılar
│   ├── theme/                  # UI estetiği ve stil yapılandırmaları
│   └── service_locator.dart    # Bağımlılık enjeksiyonu (DI) kurulumu
│
└── features/                   # Bağımsız özellik modülleri
    ├── billing/                # Sepet, Ödeme ve Fatura Üretimi
    ├── product/                # Envanter: Ekleme, Listeleme, Barkod Tarama
    ├── settings/               # Uygulama ve Yazıcı bağlantı ayarları
    └── shop/                   # Mağaza profil yapılandırması
```
    
## 🚀 Başlangıç (Getting Started)

Ön Koşullar
Flutter SDK ^3.1.0 veya üzeri.

Android Studio / Xcode.

Opsiyonel: Bluetooth Termal Yazıcı (Donanım testleri için).

### Kurulum
Depoyu klonlayın:

Bash
```bash
git clone [https://github.com/exportdepo/flutter-faturalama-uygulamasi.git](https://github.com/exportdepo/flutter-faturalama-uygulamasi.git)
Bağımlılıkları yükleyin:
```

Bash
```bash
flutter pub get
Kod oluşturucuyu çalıştırın (Hive ve JSON modelleri için):
```
Bash
```bash
dart run build_runner build --delete-conflicting-outputs
Uygulamayı çalıştırın:
```


flutter run
```

## ✅ Projeyi Doğrulama (Verification)

Kod tabanının sağlıklı olduğunu varsaymadan önce sırasıyla şu komutları çalıştırın:

```bash
# 1) Bağımlılıkların çözüldüğünü doğrula
flutter pub get

# 2) Kod üretimi (Hive adapter'ları, .g.dart dosyaları) güncel mi?
#    Önbelleğe takılmış/eksik üretilmiş dosya varsa yeniden üretir.
dart run build_runner build --delete-conflicting-outputs

# 3) Statik analiz hata vermemeli
flutter analyze

# 4) Birim/widget testleri yeşil olmalı
flutter test

# 5) Uygulamayı cihaz/emülatörde ayağa kaldır ve manuel smoke test yap
flutter devices        # bağlı cihazları listeler
flutter run

# 6) (Opsiyonel) Dağıtım paketi derlenebiliyor mu?
flutter build apk --release   # Android
flutter build ipa              # iOS (macOS gerekir)
```

Bu adımları her push'ta otomatik çalıştırmak için `.github/workflows/flutter-ci.yml`
içinde hazır bir GitHub Actions pipeline'ı bulunur.

Yarım kalan ve planlanan işler **[YAPILACAKLAR.md](YAPILACAKLAR.md)** dosyasında
madde madde (kanıt, hazır altyapı, doğrulama ölçütü ve efor tahminiyle) listelenmiştir.

### Test kapsamı (`flutter test`)

| Dosya | Ne doğrular |
|---|---|
| `test/widget_test.dart` | Uygulama açılış (smoke) testi: `MyApp` gerçek Hive + DI kurulumu, mock'lanmış kamera kanallarıyla ayağa kalkar ve ana POS ekranı render edilir. Varsayılan Türkçe açılışı ve çalışma anında İngilizceye geçişi de doğrular. |
| `test/billing_bloc_test.dart` | Sepet mantığı: barkod tarama, adet artırma/azaltma, hatalı taramada **tipli hata durumu** (l10n eşlemesine hazır) ve sepet toplamı. |
| `test/product_hive_repository_test.dart` | Gerçek Hive kutusuyla uçtan uca CRUD (ekle/listele/güncelle/sil) ve `ProductBloc` entegrasyonu. |
| `test/core_utils_test.dart` | `CartItem`, `AppValidators` ve `CurrencyFormatter` birim testleri. |

### Manuel smoke test senaryosu (cihaz üzerinde)

1. Uygulama açıldığında ana ekranda barkod tarayıcı görünür.
2. **Products** ekranından yeni ürün ekleyin (barkod + fiyat).
3. Ana ekrandan ürünü barkoduyla tarayın; sepete düşmeli ve toplam güncellenmeli.
4. **Review Order** ile ödeme ekranına gidip işlemi tamamlayın.
5. **Settings**'ten Bluetooth termal yazıcıyı bağlayıp test çıktısı alın *(bu adım fiziksel donanım gerektirir; emülatörde doğrulanamaz)*.

> Not: Kamera, Bluetooth yazıcı ve titreşim gibi donanım bağımlılıkları yalnızca
> fiziksel cihazda test edilebilir; test otomasyonu bu kanalları mock'lar.

👨‍💻 Geliştirici ve Katkı
exportdepo

Not: Bu proje, Clean Architecture kurallarına ve değişmez durum (immutable state) yönetimine sıkı sıkıya bağlıdır.
