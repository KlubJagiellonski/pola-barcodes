import 'package:flutter/material.dart';

class AddBarcodeForm extends StatefulWidget {
  final void Function(String description, String data) onAddBarcode;

  const AddBarcodeForm({super.key, required this.onAddBarcode});

  @override
  State<AddBarcodeForm> createState() => _AddBarcodeFormState();
}

class _AddBarcodeFormState extends State<AddBarcodeForm> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  void _handleAddBarcode() {
    final description = _descriptionController.text;
    final data = _dataController.text;

    if (description.isNotEmpty && data.isNotEmpty) {
      widget.onAddBarcode(description, data);
      _descriptionController.clear();
      _dataController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onPressed: _handleAddBarcode,
            child: const Text('Dodaj kod kreskowy'),
          ),
        ],
      ),
    );
  }
}