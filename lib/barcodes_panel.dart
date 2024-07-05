import 'package:flutter/material.dart';

class BarcodesPanel extends StatelessWidget {
  const BarcodesPanel({
    super.key,
    required this.descriptionController,
    required this.dataController,
    required this.onAddBarcode,
  });

  final TextEditingController descriptionController;
  final TextEditingController dataController;
  final VoidCallback onAddBarcode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Opis',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: dataController,
              decoration: const InputDecoration(
                labelText: 'Kod kreskowy',
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onAddBarcode,
            child: const Text('Dodaj kod kreskowy'),
          ),
        ],
      ),
    );
  }
}