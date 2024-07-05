import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'barcode_detail_page.dart';
import 'barcode_item_widget.dart'; 

class BarcodesListView extends StatelessWidget {
  const BarcodesListView({
    super.key,
    required this.barcodes,
  });

  final List<BarcodeItem> barcodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (barcodes.length / 2).ceil(),
      itemBuilder: (context, index) {
        final leftBarcode = barcodes[index * 2];
        final rightBarcode = (index * 2 + 1 < barcodes.length)
            ? barcodes[index * 2 + 1]
            : null;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: _buildBarcodeRow(context, leftBarcode, rightBarcode),
        );
      },
    );
  }

  Widget _buildBarcodeRow(BuildContext context, BarcodeItem leftBarcode, BarcodeItem? rightBarcode) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BarcodeDetailPage(barcode: leftBarcode),
                ),
              );
            },
            child: BarcodeItemWidget(barcode: leftBarcode),
          ),
        ),
        const SizedBox(width: 10),
        if (rightBarcode != null)
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BarcodeDetailPage(barcode: rightBarcode),
                  ),
                );
              },
              child: BarcodeItemWidget(barcode: rightBarcode),
            ),
          ),
      ],
    );
  }
}