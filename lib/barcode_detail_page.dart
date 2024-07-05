import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodeDetailPage extends StatelessWidget {
  final BarcodeItem barcode;

  const BarcodeDetailPage({super.key, required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
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
