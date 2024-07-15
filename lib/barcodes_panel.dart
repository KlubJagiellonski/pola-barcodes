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
        if (barcodeType.barcode.isValid(data)) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: _Constants.errorHeight,
            child: errorText != null
                ? Text(
                    errorText,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _dropdownField() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<custom.BarcodeType>(
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
          const SizedBox(height: _Constants.errorHeight),
        ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textField(_descriptionController, "Opis", _descriptionError),
              const SizedBox(width: _Constants.fieldSpacing),
              _textField(_dataController, "Kod kreskowy", _dataError),
              const SizedBox(width: _Constants.fieldSpacing),
              _dropdownField(),
              const SizedBox(width: _Constants.fieldSpacing),
              Padding(
                padding: const EdgeInsets.only(top: _Constants.topPadding),
                child: ElevatedButton(
                  onPressed: _handleAddBarcode,
                  child: const Text('Dodaj kod kreskowy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Constants {
  static const double errorHeight = 20.0;
  static const double fieldSpacing = 10.0;
  static const double topPadding = 20.0;
}