import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  factory BarcodeScannerStatus.barcode(String barcode) =>
      BarcodeScannerStatus(barcode: barcode, stopScanner: true);

  factory BarcodeScannerStatus.error(String message) =>
      BarcodeScannerStatus(error: message, stopScanner: true);

  factory BarcodeScannerStatus.available() =>
      BarcodeScannerStatus(isAvailable: true, stopScanner: false);

  BarcodeScannerStatus({
    this.isAvailable = false,
    this.error = '',
    this.barcode = '',
    this.stopScanner = false,
  });

  final bool isAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  bool get showCamera => isAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;

  BarcodeScannerStatus copyWith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarcodeScannerStatus(
      isAvailable: isAvailable ?? this.isAvailable,
      error: error ?? this.error,
      barcode: barcode ?? this.barcode,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
