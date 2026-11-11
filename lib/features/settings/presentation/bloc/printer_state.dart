import 'package:equatable/equatable.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

enum PrinterStatus {
  initial,
  scanning,
  scanSuccess,
  scanFailure,
  connecting,
  connected,
  connectionFailure,
  disconnected,
  testPrinting
}

/// UI katmanının l10n ile eşleyeceği tipli yazıcı hata kodu.
///
/// Bloc katmanında BuildContext bulunmadığından kullanıcıya gösterilecek
/// metin burada üretilmez; [PrinterState.errorMessage] yalnızca teknik
/// detay taşır.
enum PrinterErrorCode {
  /// Eşleştirilmiş Bluetooth cihazı bulunamadı.
  noPairedDevices,

  /// Eşleştirilmiş hiçbir cihaza bağlanılamadı.
  couldNotConnectAny,

  /// Belirli bir yazıcıya bağlanma denemesi başarısız oldu.
  connectFailed,

  /// Cihaz taraması istisna fırlattı (ham detay [PrinterState.errorMessage]).
  scanFailed,
}

class PrinterState extends Equatable {
  final PrinterStatus status;
  final String? connectedMac;
  final String? connectedName;
  final List<BluetoothInfo> devices;
  final String? errorMessage;
  final PrinterErrorCode? errorCode;

  const PrinterState({
    this.status = PrinterStatus.initial,
    this.connectedMac,
    this.connectedName,
    this.devices = const [],
    this.errorMessage,
    this.errorCode,
  });

  PrinterState copyWith({
    PrinterStatus? status,
    String? connectedMac,
    String? connectedName,
    List<BluetoothInfo>? devices,
    String? errorMessage,
    PrinterErrorCode? errorCode,
    bool clearError = false,
  }) {
    return PrinterState(
      status: status ?? this.status,
      connectedMac: connectedMac ?? this.connectedMac,
      connectedName: connectedName ?? this.connectedName,
      devices: devices ?? this.devices,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      errorCode: clearError ? null : (errorCode ?? this.errorCode),
    );
  }

  @override
  List<Object?> get props =>
      [status, connectedMac, connectedName, devices, errorMessage, errorCode];
}
