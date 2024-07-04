import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'barcode_item.dart';

class BarcodeItemWidget extends StatelessWidget {
  const BarcodeItemWidget({
    super.key,
    required this.barcode,
  });

  final BarcodeItem barcode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          barcode.description,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        BarcodeWidget(
          barcode: barcode.type,
          data: barcode.data,
          width: 200,
          height: 100,
          drawText: true,
          style: const TextStyle(
            fontSize: 16,
            letterSpacing: 1.5,
          ),
        ),
      ],
    );
  }
}