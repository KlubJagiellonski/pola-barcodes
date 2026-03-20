import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'barcode_item.dart';
import 'barcode_item_widget.dart';

class BarcodeDetailPage extends StatelessWidget {
  final BarcodeItem barcode;

  const BarcodeDetailPage({super.key, required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(barcode.description),
        leading: !context.canPop()
            ? IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => context.go('/'),
              )
            : null,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarcodeItemWidget(barcode: barcode),
          ],
        ),
      ),
    );
  }
}
