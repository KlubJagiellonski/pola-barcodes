import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'barcode_item.dart';
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
  void _addBarcode(String description, String data, Barcode type) {
    if (description.isNotEmpty && data.isNotEmpty) {
      setState(() {
        widget.barcodes.add(
          BarcodeItem(
            description: description,
            data: data,
            type: type,
          ),
        );
      });
    }
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
              child: BarcodesListView(barcodes: widget.barcodes),
            ),
            const SizedBox(height: 8.0),
            BarcodesPanel(onAddBarcode: _addBarcode),
          ],
        ),
      ),
    );
  }
}