// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Billing App';

  @override
  String get checkout => 'Checkout';

  @override
  String get productName => 'Product Name';

  @override
  String get price => 'Price';

  @override
  String get total => 'Total';

  @override
  String get grandTotal => 'GRAND TOTAL';

  @override
  String get scanToPay => 'Scan to Pay';

  @override
  String get printReceipt => 'Print Receipt';

  @override
  String get printedSuccessfully => 'Receipt printed successfully';

  @override
  String get shopDetailsNotLoaded => 'Shop details not loaded';

  @override
  String get products => 'Products';

  @override
  String get addProduct => 'Add Product';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get settings => 'Settings';

  @override
  String get shopDetails => 'Shop Details';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get noProducts => 'No products found';

  @override
  String get search => 'Search';

  @override
  String get totalItems => 'total items';

  @override
  String get productNameLabel => 'Product Name';

  @override
  String get barcodeLabel => 'Barcode';

  @override
  String get priceLabel => 'Price';

  @override
  String get stockLabel => 'Stock';

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidPrice => 'Invalid price';

  @override
  String get printSuccess => 'Print successful';

  @override
  String get printFailed => 'Print failed';

  @override
  String get productAdded => 'Product added successfully';

  @override
  String get productUpdated => 'Product updated successfully';

  @override
  String get productDeleted => 'Product deleted successfully';

  @override
  String get enterProductName => 'Enter product name';

  @override
  String get enterBarcode => 'Enter barcode number';

  @override
  String get enterPrice => 'Enter price';

  @override
  String get enterStock => 'Enter stock quantity';

  @override
  String get saveProduct => 'Save Product';

  @override
  String get updateProduct => 'Update Product';

  @override
  String deleteProductConfirm(String name) {
    return 'Are you sure you want to delete $name?';
  }

  @override
  String get confirmDelete => 'Confirm Delete';

  @override
  String get shopName => 'Shop Name';

  @override
  String get shopAddress => 'Address';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get footerText => 'Footer Text';

  @override
  String maxLengthHint(int count) {
    return 'Max $count';
  }

  @override
  String get iban => 'IBAN';

  @override
  String get bankName => 'Bank Name';

  @override
  String get enterShopName => 'Enter shop name';

  @override
  String get enterAddress => 'Enter address';

  @override
  String get enterPhone => 'Enter phone number';

  @override
  String get enterIban => 'Enter IBAN number';

  @override
  String get enterBankName => 'Enter bank name';

  @override
  String get enterFooterText => 'Enter footer text';

  @override
  String get updateShopDetails => 'Update Shop Details';

  @override
  String get printerSettings => 'Printer Settings';

  @override
  String get connectPrinter => 'Connect Printer';

  @override
  String get disconnectPrinter => 'Disconnect Printer';

  @override
  String get printTest => 'Test Print';

  @override
  String get printerConnected => 'Printer connected';

  @override
  String get printerDisconnected => 'Printer disconnected';

  @override
  String get noPrinterFound => 'No printer found';

  @override
  String get scanningPrinters => 'Scanning printers...';

  @override
  String get scanProduct => 'Scan Product';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get cart => 'Cart';

  @override
  String get clearCart => 'Clear Cart';

  @override
  String get itemAdded => 'Item added to cart';

  @override
  String get itemRemoved => 'Item removed from cart';

  @override
  String get quantity => 'Quantity';

  @override
  String get increase => 'Increase';

  @override
  String get decrease => 'Decrease';

  @override
  String get emptyCart => 'Cart is empty';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tax => 'Tax';

  @override
  String get language => 'Language';

  @override
  String get turkish => 'Turkish';

  @override
  String get english => 'English';

  @override
  String productNotFound(String barcode) {
    return 'Product not found: $barcode';
  }

  @override
  String get error => 'Error';

  @override
  String get success => 'Success';

  @override
  String get loading => 'Loading...';

  @override
  String get home => 'Home';

  @override
  String get paymentInfo => 'Payment Info';

  @override
  String get cashPayment => 'Cash Payment';

  @override
  String get transferPayment => 'Bank Transfer';

  @override
  String get qrCode => 'QR Code';

  @override
  String get reviewOrder => 'Review Order';

  @override
  String get turnOnCamera => 'Turn on Camera';

  @override
  String get cameraOffHint =>
      'Turn on your camera to start scanning barcodes and items automatically.';

  @override
  String get cameraOffTitle => 'Camera is turned off';

  @override
  String get scannedItems => 'Scanned Items';

  @override
  String totalItemsCount(int count) {
    return '$count items total';
  }

  @override
  String get totalPrice => 'TOTAL PRICE';

  @override
  String get emptyCartHint =>
      'Scanned items will appear here as you scan them with the camera above.';

  @override
  String get scanBarcode => 'Scan Barcode';

  @override
  String get alignBarcodeHint => 'Align barcode within frame';

  @override
  String get productManagement => 'Product Management';

  @override
  String get scanOrEnterBarcode => 'Scan or enter barcode';

  @override
  String get tapToScanHint => 'Tap the icon to open camera scanner';

  @override
  String barcodeExists(String barcode) {
    return 'Product with barcode \"$barcode\" already exists!';
  }

  @override
  String get exampleProductName => 'e.g. Basmati Rice';

  @override
  String get deleteProductTitle => 'Delete Product';

  @override
  String get noProductsMatch => 'No products match your search.';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get sectionManagement => 'MANAGEMENT';

  @override
  String get sectionLanguage => 'LANGUAGE';

  @override
  String get sectionHardware => 'HARDWARE';

  @override
  String get manageStockSubtitle => 'Manage stock and barcodes';

  @override
  String get businessInfoSubtitle => 'Edit business info & address';

  @override
  String get selectAppLanguage => 'Select app language';

  @override
  String get printDevice => 'Print Device';

  @override
  String get noPrinterConnected => 'No printer connected';

  @override
  String get connected => 'CONNECTED';

  @override
  String get pairPrinterHint =>
      'To connect a new device, tap on the Settings gear to pair in phone\'s Bluetooth settings, then return and hit Refresh.';

  @override
  String get printerAutoConnectFailed => 'Failed to auto-connect to printer!';

  @override
  String get printerNotConfigured =>
      'Printer not connected & no saved printer found!';

  @override
  String printFailedWithMessage(String message) {
    return 'Print failed: $message';
  }

  @override
  String get noPairedDevices => 'No paired devices found.';

  @override
  String get couldNotConnectPrinterAny =>
      'Could not connect to any paired device.';

  @override
  String get printerConnectFailed => 'Failed to connect to printer.';

  @override
  String scanFailedWithMessage(String message) {
    return 'Scan failed: $message';
  }
}
