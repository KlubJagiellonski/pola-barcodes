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
        automaticallyImplyLeading: false, // Usuwa przycisk "Back"
        elevation: 0, // Usuwa cień z AppBar
        backgroundColor: Colors.transparent, // Ustawia tło AppBar na przezroczyste
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              barcode.description,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            BarcodeWidget(
              barcode: barcode.type,
              data: barcode.data,
              width: 300,
              height: 150,
              drawText: true,
              style: const TextStyle(fontSize: 16, letterSpacing: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}