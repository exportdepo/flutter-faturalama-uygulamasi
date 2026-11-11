part of 'product_bloc.dart';

enum ProductStatus { initial, loading, loaded, error, success }

/// Başarıyla tamamlanan son ürün işlemi.
///
/// Bloc katmanında BuildContext bulunmadığından başarı metni burada üretilmez;
/// UI, bu bilgi ile uygun l10n anahtarını seçer.
enum ProductAction { add, update, delete }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product> products;
  final String? message;
  final ProductAction? lastAction;

  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.message,
    this.lastAction,
  });

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    String? message,
    ProductAction? lastAction,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      message: message,
      lastAction: lastAction ?? this.lastAction,
    );
  }

  @override
  List<Object?> get props => [status, products, message, lastAction];
}
