import 'package:barcode_widget/barcode_widget.dart';

class BarcodeItem {
  final String description;
  final String data;
  final Barcode type;

  BarcodeItem({
    required this.description,
    required this.data,
    required this.type,
  });

  static final List<BarcodeItem> barcodes = [
    BarcodeItem(
        description: "Firma nie zweryfikowana",
        data: "5905499300707",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Firma zweryfikowana z pełną punktacją",
        data: "5907632637572",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Firma zweryfikowana z niepełną punktacją",
        data: "5900497025454",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Kod wewnętrzny",
         data: "00000000", 
        type: Barcode.ean8()),
    BarcodeItem(
        description: "Firma zarejestrowana poza Polską",
        data: "8680861069075",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Firma zarejerstrowana w ...",
        data: "5090000000006",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Marka własna Lidla",
        data: "20982515",
        type: Barcode.ean8()),
    BarcodeItem(
        description: "Przyjaciel Poli",
        data: "5906395053018",
        type: Barcode.ean13()),
    BarcodeItem(
        description: "Rozszerzony opis firmy",
        data: "9771644705002",
        type: Barcode.ean13()),
  ];
}

