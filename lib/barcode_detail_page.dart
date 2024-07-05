import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeDetailPage extends StatelessWidget {
  final BarcodeItem barcode;

  const BarcodeDetailPage({super.key, required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opis Kodu Kreskowego'),
        automaticallyImplyLeading: false, // removes button "Back"
      ),
      body: Center(
        child: BarcodeWidget(
          barcode: barcode.type,
          data: barcode.data,
          width: 300,
          height: 150,
          drawText: true,
          style: const TextStyle(fontSize: 16, letterSpacing: 1.5),
        ),
      ),
    );
  }
}


