import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'barcode_type.dart' as custom;

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
  custom.BarcodeType _selectedBarcodeType = custom.BarcodeType.ean13;

  String? _descriptionError;
  String? _dataError;

  @override
  void dispose() {
    _descriptionController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  void _handleAddBarcode() {
    final description = _descriptionController.text;
    final data = _dataController.text;
    final barcodeType = _selectedBarcodeType;

    setState(() {
      _descriptionError = description.isEmpty ? "Opis nie może być pusty" : null;
      _dataError = data.isEmpty ? "Kod kreskowy nie może być pusty" : null;

      if (_descriptionError == null && _dataError == null) {
        if (barcodeType.isValid(data)) {
          widget.onAddBarcode(description, data, barcodeType.barcode);
          _descriptionController.clear();
          _dataController.clear();
        } else {
          _dataError = "Nieprawidłowy kod kreskowy";
        }
      }
    });
  }

  Widget _textField(TextEditingController controller, String label, String? errorText) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          errorText: errorText,
        ),
      ),
    );
  }

  Widget _dropdownField() {
    return Expanded(
      child: DropdownButtonFormField<custom.BarcodeType>(
        value: _selectedBarcodeType,
        decoration: const InputDecoration(
          labelText: "Typ kodu",
        ),
        items: custom.BarcodeType.values.map((custom.BarcodeType type) {
          return DropdownMenuItem<custom.BarcodeType>(
            value: type,
            child: Text(type.name),
          );
        }).toList(),
        onChanged: (custom.BarcodeType? newValue) {
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
              _textField(_descriptionController, "Opis", _descriptionError),
              const SizedBox(width: 10),
              _textField(_dataController, "Kod kreskowy", _dataError),
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
