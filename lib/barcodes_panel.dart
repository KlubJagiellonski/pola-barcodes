import 'package:flutter/material.dart';

class BarcodesPanel extends StatefulWidget {
  const BarcodesPanel({
    super.key,
    required this.onAddBarcode,
  });

  final void Function(String description, String data) onAddBarcode;

  @override
  _BarcodesPanelState createState() => _BarcodesPanelState();
}

class _BarcodesPanelState extends State<BarcodesPanel> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                onPressed: _handleAddBarcode,
                child: const Text('Dodaj kod kreskowy'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}