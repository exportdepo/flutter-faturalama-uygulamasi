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
👨‍💻 Geliştirici ve Katkı
exportdepo

Not: Bu proje, Clean Architecture kurallarına ve değişmez durum (immutable state) yönetimine sıkı sıkıya bağlıdır.
