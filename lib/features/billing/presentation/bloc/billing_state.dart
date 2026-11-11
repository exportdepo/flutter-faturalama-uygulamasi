part of 'billing_bloc.dart';

/// BillingBloc'un oluşturduğu hata türleri.
///
/// Bloc katmanında BuildContext bulunmadığından kullanıcıya gösterilecek
/// metin burada üretilmez; UI bu tipleri l10n anahtarlarıyla eşler.
enum BillingErrorType {
  /// Taranan barkoda karşılık ürün bulunamadı.
  productNotFound,

  /// Kayıtlı yazıcıya otomatik bağlanma denemesi başarısız oldu.
  printerAutoConnectFailed,

  /// Yazıcı bağlı değil ve kayıtlı yazıcı da bulunamadı.
  printerNotConfigured,

  /// Fiş yazdırma işlemi istisna fırlattı.
  printFailed,
}

/// Tipli fatura hatası: hata kodu + varsa bağlam verisi.
class BillingError extends Equatable {
  final BillingErrorType type;

  /// [BillingErrorType.productNotFound] için taranan barkod.
  final String? barcode;

  /// Teknik detay (ör. istisnanın kendisi) — yalnızca bilgi amaçlı.
  final String? rawMessage;

  const BillingError(
    this.type, {
    this.barcode,
    this.rawMessage,
  });

  @override
  List<Object?> get props => [type, barcode, rawMessage];
}

class BillingState extends Equatable {
  final List<CartItem> cartItems;
  final BillingError? error;
  final bool isPrinting;
  final bool printSuccess;

  const BillingState({
    this.cartItems = const [],
    this.error,
    this.isPrinting = false,
    this.printSuccess = false,
  });

  double get totalAmount => cartItems.fold(0, (sum, item) => sum + item.total);

  BillingState copyWith({
    List<CartItem>? cartItems,
    BillingError? error,
    bool clearError = false,
    bool? isPrinting,
    bool? printSuccess,
  }) {
    return BillingState(
      cartItems: cartItems ?? this.cartItems,
      error: clearError ? null : (error ?? this.error),
      isPrinting: isPrinting ?? this.isPrinting,
      printSuccess: printSuccess ?? this.printSuccess,
    );
  }

  @override
  List<Object?> get props => [cartItems, error, isPrinting, printSuccess];
}
