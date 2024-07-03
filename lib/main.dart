import 'package:barcodes/barcode_item.dart';
import 'package:flutter/material.dart';
import 'barcode_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barcode Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BarcodePage(barcodes: BarcodeItem.barcodes),
    );
  }
}



