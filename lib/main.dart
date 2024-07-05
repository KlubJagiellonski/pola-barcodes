import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'barcodes_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kody Testowe Poli',
     home: BarcodesPage(barcodes: BarcodeItem.barcodes),
    );
  }
}
