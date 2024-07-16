import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'barcode_type.dart' as custom;
import ' i18n/strings.g.dart';
class BarcodesPanel extends StatefulWidget {
  const BarcodesPanel({
    super.key,
    required this.onAddBarcode,
  });

  final void Function(String description, String data, Barcode type)
      onAddBarcode;

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
      _descriptionError = description.isEmpty ? Translations.of(context).error1:  null;
      _dataError = data.isEmpty ?  Translations.of(context).error2 : null;

      if (_descriptionError == null && _dataError == null) {
        if (barcodeType.barcode.isValid(data)) {
          widget.onAddBarcode(description, data, barcodeType.barcode);
          _descriptionController.clear();
          _dataController.clear();
        } else  {
          _dataError =  Translations.of(context).error3;
        }
      }
    });
  }

  Widget _textField(
      TextEditingController controller, String label, String? errorText) {
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
            height: Constants.errorHeight,
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

  Widget _dropdownField(BuildContext context) {
       return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          DropdownButtonFormField<custom.BarcodeType>(
            value: _selectedBarcodeType,
            decoration: InputDecoration(
              labelText:  Translations.of(context).codetype,
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
          const SizedBox(height: Constants.errorHeight)
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
              _textField(_descriptionController, Translations.of(context).opis, _descriptionError),
              const SizedBox(width: Constants.fieldSpacing),
              _textField(_dataController,  Translations.of(context).kod, _dataError),
              const SizedBox(width: Constants.fieldSpacing),
              _dropdownField(context),
              const SizedBox(width: Constants.fieldSpacing),
              Padding(
                padding: const EdgeInsets.only(top: Constants.errorHeight),
                child: ElevatedButton(
                  onPressed: _handleAddBarcode,
                  child:  Text (Translations.of(context).kodplus),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Constants {
  static const double errorHeight = 20.0;
  static const double fieldSpacing = 10.0;
}
