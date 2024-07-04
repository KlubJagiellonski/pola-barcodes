import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'barcode_detail_page.dart';

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
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  void _addBarcode() {
    final description = _descriptionController.text;
    final data = _dataController.text;

    if (description.isNotEmpty && data.isNotEmpty) {
      setState(() {
        widget.barcodes.add(
          BarcodeItem(
            description: description,
            data: data,
            type: Barcode.ean13(),
          ),
        );
      });

      _descriptionController.clear();
      _dataController.clear();
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Opis',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _dataController,
                      decoration: const InputDecoration(
                        labelText: 'Kod kreskowy',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _addBarcode,
                    child: const Text('Dodaj kod kreskowy'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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