import 'package:flutter/material.dart';
import 'barcode_item.dart';
import 'barcode_storage.dart';
import 'barcode_type.dart';
import 'barcodes_list_view.dart';
import 'barcodes_panel.dart';
import 'i18n/strings.g.dart';

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
  late final List<BarcodeItem> _userBarcodes;

  List<BarcodeItem> get _allBarcodes =>
      [...widget.barcodes, ..._userBarcodes];

  @override
  void initState() {
    super.initState();
    _userBarcodes = loadBarcodesFromStorage() ?? [];
  }

  void _addBarcode(String description, String data, BarcodeType type) {
    if (description.isNotEmpty && data.isNotEmpty) {
      setState(() {
        _userBarcodes.add(
          BarcodeItem(
            description: description,
            data: data,
            type: type,
          ),
        );
        saveBarcodesToStorage(_userBarcodes);
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).barcodeList)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: BarcodesListView(barcodes: _allBarcodes),
            ),
            const SizedBox(height: 8.0),
            BarcodesPanel(onAddBarcode: _addBarcode),
          ],
        ),
      ),
    );
  }
}
