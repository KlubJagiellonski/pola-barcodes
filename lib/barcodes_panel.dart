import 'package:flutter/material.dart';

class BarcodesPanel extends StatefulWidget {
  const BarcodesPanel({
    super.key,
    required this.onAddBarcode,
  });

  final void Function(String description, String data) onAddBarcode;

  @override
  BarcodesPanelState createState() => BarcodesPanelState();
}

class BarcodesPanelState extends State<BarcodesPanel> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  void _handleAddBarcode() {
    final description = _descriptionController.text;
    final data = _dataController.text;

    widget.onAddBarcode(description, data);

    _descriptionController.clear();
    _dataController.clear();
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _textField(_descriptionController, "Opis"),
          const SizedBox(width: 10),
          _textField(_dataController, "Kod kreskowy"),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: _handleAddBarcode,
            child: const Text('Dodaj kod kreskowy'),
          ),
        ],
      ),
    );
  }
}
