 import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'barcode_detail_page.dart';

class BarcodesPage extends StatelessWidget {
  const BarcodesPage({
    super.key,
    required this.barcodes,
  });

  final List<BarcodeItem> barcodes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Kodów Kreskowych'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: (barcodes.length / 2).ceil(),
          itemBuilder: (context, index) {
            final leftBarcode = barcodes[index * 2];
            final rightBarcode = (index * 2 + 1 < barcodes.length) ? barcodes[index * 2 + 1] : null;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: buildBarcodeItem(context, leftBarcode),
                  ),
                  const SizedBox(width: 10),
                  if (rightBarcode != null)
                    Expanded(
                      child: buildBarcodeItem(context, rightBarcode),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildBarcodeItem(BuildContext context, BarcodeItem barcode) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BarcodeDetailPage(barcode: barcode),
          ),
        );
      },
      child: BarcodeItemWidget(barcode: barcode),
    );
  }
}

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
