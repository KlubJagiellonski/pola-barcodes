import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import ' i18n/strings.g.dart';

class BarcodeItem {
  final String description;
  final String data;
  final Barcode type;

  BarcodeItem({
    required this.description,
    required this.data,
    required this.type,
  });

 static List<BarcodeItem> barcodes(BuildContext context){
  return [
    BarcodeItem(
        description: Translations.of(context).dsc1,
        data: "5905499300707",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc2,
        data: "5907632637572",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc3,
        data: "5900497025454",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc4 ,data: "00000000", type: Barcode.ean8()),
    BarcodeItem(
        description:  Translations.of(context).dsc5,
        data: "8680861069075",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc6,
        data: "5090000000006",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc7,
        data: "20982515",
        type: Barcode.ean8()),
    BarcodeItem(
        description:  Translations.of(context).dsc8,
        data: "5906395053018",
        type: Barcode.ean13()),
    BarcodeItem(
        description:  Translations.of(context).dsc9,
        data: "9771644705002",
        type: Barcode.ean13()),
  ];
}
}
