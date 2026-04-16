import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final NumberFormat _turkishFormat = NumberFormat.currency(
    locale: 'tr_TR',
    symbol: '₺',
    decimalDigits: 2,
  );

  static final NumberFormat _englishFormat = NumberFormat.currency(
    locale: 'en_US',
    symbol: '₺',
    decimalDigits: 2,
  );

  static final NumberFormat _simpleFormat = NumberFormat('#,##0.00', 'tr_TR');

  static String format(double amount, {String locale = 'tr'}) {
    if (locale == 'en') {
      return _englishFormat.format(amount);
    }
    return _turkishFormat.format(amount);
  }

  static String formatSimple(double amount) {
    return _turkishFormat.format(amount);
  }

  static String formatForPrinter(double amount) {
    return _simpleFormat.format(amount);
  }
}
