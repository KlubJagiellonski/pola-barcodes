import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'barcode_item_widget.dart';

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
            BarcodeItemWidget(barcode: barcode),
          ],
        ),
      ),
    );
  }
}
