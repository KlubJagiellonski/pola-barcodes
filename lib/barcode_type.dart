import 'package:barcode_widget/barcode_widget.dart';

enum BarcodeType {
  ean13,
  ean8,
}

extension BarcodeTypeExtension on BarcodeType {
  String get name {
    switch (this) {
      case BarcodeType.ean13:
        return 'EAN13';
      case BarcodeType.ean8:
        return 'EAN8';
    }
  }

  Barcode get barcode {
    switch (this) {
      case BarcodeType.ean13:
        return Barcode.ean13();
      case BarcodeType.ean8:
        return Barcode.ean8();
    }
  }

  bool isValid(String data) {
    switch (this) {
      case BarcodeType.ean13:
        return data.length == 13 && RegExp(r'^\d+$').hasMatch(data);
      case BarcodeType.ean8:
        return data.length == 8 && RegExp(r'^\d+$').hasMatch(data);
    }
  }
}
