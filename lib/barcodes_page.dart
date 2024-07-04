import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'barcode_detail_page.dart';
import 'barcodes_list_view.dart';
import 'barcodes_panel.dart';

class BarcodesPage extends StatefulWidget {
  const BarcodesPage({
    super.key,
    required this.barcodes,
  });

  final List<BarcodeItem> barcodes;

  @override
  BarcodesPageState createState() => BarcodesPageState();
}

class BarcodesPageState extends State<BarcodesPage> {
  void _addBarcode(String description, String data) {
    setState(() {
      widget.barcodes.add(
        BarcodeItem(
          description: description,
          data: data,
          type: Barcode.ean13(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Kodów Kreskowych'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: (widget.barcodes.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final leftBarcode = widget.barcodes[index * 2];
                  final rightBarcode = (index * 2 + 1 < widget.barcodes.length)
                      ? widget.barcodes[index * 2 + 1]
                      : null;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      BarcodeDetailPage(barcode: leftBarcode),
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
                                    builder: (context) =>
                                        BarcodeDetailPage(barcode: rightBarcode),
                                  ),
                                );
                              },
                              child: BarcodeItemWidget(barcode: rightBarcode),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AddBarcodeForm(onAddBarcode: _addBarcode),
          ],
        ),
      ),
    );
  }
}