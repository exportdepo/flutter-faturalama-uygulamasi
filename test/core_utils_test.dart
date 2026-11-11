// Çekirdek yardımcıların birim testleri:
// CartItem (sepet toplamı), AppValidators ve CurrencyFormatter.

import 'package:flutter_test/flutter_test.dart';

import 'package:billing_app/core/utils/app_validators.dart';
import 'package:billing_app/core/utils/currency_formatter.dart';
import 'package:billing_app/features/billing/domain/entities/cart_item.dart';
import 'package:billing_app/features/product/domain/entities/product.dart';

void main() {
  const water = Product(
    id: 'p1',
    name: 'Su 0.5L',
    barcode: '8690000000001',
    price: 10.0,
  );

  group('CartItem', () {
    test('toplam tutar fiyat x adettir', () {
      const item = CartItem(product: water, quantity: 3);
      expect(item.total, 30.0);
    });

    test('adet 1 varsayılan değerdir', () {
      const item = CartItem(product: water);
      expect(item.quantity, 1);
      expect(item.total, 10.0);
    });

    test('copyWith yalnızca verilen alanı değiştirir', () {
      const item = CartItem(product: water, quantity: 2);
      final updated = item.copyWith(quantity: 5);

      expect(updated.quantity, 5);
      expect(updated.product.id, 'p1');
      expect(updated.product.name, 'Su 0.5L');
    });
  });

  group('AppValidators.required', () {
    final validator = AppValidators.required('Zorunlu alan');

    test('boş değer hata mesajı döndürür', () {
      expect(validator(null), 'Zorunlu alan');
      expect(validator(''), 'Zorunlu alan');
      expect(validator('   '), 'Zorunlu alan');
    });

    test('dolu değer hatasızdır', () {
      expect(validator('Ekmek'), isNull);
    });
  });

  group('AppValidators.price', () {
    test('boş değer hata döndürür', () {
      expect(AppValidators.price(''), isNotNull);
      expect(AppValidators.price('   '), isNotNull);
    });

    test('sayısal olmayan değer hata döndürür', () {
      expect(AppValidators.price('abc'), isNotNull);
      expect(AppValidators.price('12,5 TL'), isNotNull);
    });

    test('negatif fiyat hata döndürür', () {
      expect(AppValidators.price('-5'), isNotNull);
    });

    test('geçerli fiyat hatasızdır', () {
      expect(AppValidators.price('12.5'), isNull);
      expect(AppValidators.price('0'), isNull);
    });
  });

  group('CurrencyFormatter', () {
    test('formatForPrinter TR biçimi kullanır ve para simgesi içermez', () {
      expect(CurrencyFormatter.formatForPrinter(1234.5), '1.234,50');
    });

    test('format desimal ayırıcıyı yerel ayara göre seçer', () {
      expect(CurrencyFormatter.format(25.99, locale: 'tr'), contains('25,99'));
      expect(CurrencyFormatter.format(25.99, locale: 'en'), contains('25.99'));
    });
  });
}
