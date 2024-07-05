import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class BarcodesPanel extends StatefulWidget {
  const BarcodesPanel({
    super.key,
    required this.onAddBarcode,
  });

  final void Function(String description, String data, Barcode type) onAddBarcode;

  @override
  BarcodesPanelState createState() => BarcodesPanelState();
}

class BarcodesPanelState extends State<BarcodesPanel> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  String _selectedBarcodeType = 'EAN13';

  @override
  void dispose() {
    _descriptionController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  void _handleAddBarcode() {
    final description = _descriptionController.text;
    final data = _dataController.text;

    Barcode barcodeType;
    if (_selectedBarcodeType == 'EAN13') {
      barcodeType = Barcode.ean13();
    } else {
      barcodeType = Barcode.ean8();
    }

    if (description.isNotEmpty && data.isNotEmpty) {
      widget.onAddBarcode(description, data, barcodeType);
      _descriptionController.clear();
      _dataController.clear();
    }
  }

  Widget _textField(TextEditingController controller, String label) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }

  Widget _dropdownField() {
    return Expanded(
      child: DropdownButtonFormField<String>(
        value: _selectedBarcodeType,
        decoration: const InputDecoration(
          labelText: "Typ kodu",
        ),
        items: const [
          DropdownMenuItem(
            value: 'EAN13',
            child: Text("EAN13"),
          ),
          DropdownMenuItem(
            value: 'EAN8',
            child: Text("EAN8"),
          ),
        ],
        onChanged: (String? newValue) {
          setState(() {
            if (newValue != null) {
              _selectedBarcodeType = newValue;
            }
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              _textField(_descriptionController, "Opis"),
              const SizedBox(width: 10),
              _textField(_dataController, "Kod kreskowy"),
              const SizedBox(width: 10),
              _dropdownField(),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _handleAddBarcode,
                child: const Text('Dodaj kod kreskowy'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}