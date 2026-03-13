import 'package:barcode_widget/barcode_widget.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum BarcodeType {
  ean13,
  ean8,
}

extension BarcodeTypeExtension on BarcodeType {
  String get displayName {
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
}
