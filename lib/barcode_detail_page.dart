import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'barcode_item.dart';
import 'barcode_item_widget.dart';
import 'i18n/strings.g.dart';
import 'pola_api.dart';

class BarcodeDetailPage extends StatefulWidget {
  final BarcodeItem barcode;
  final PolaApi? api;

  const BarcodeDetailPage({super.key, required this.barcode, this.api});

  @override
  State<BarcodeDetailPage> createState() => _BarcodeDetailPageState();
}

class _BarcodeDetailPageState extends State<BarcodeDetailPage> {
  late final PolaApi _api;
  late Future<dynamic> _future;

  @override
  void initState() {
    super.initState();
    _api = widget.api ?? PolaApi();
    _future = widget.barcode.data.isEmpty
        ? Future.value(null)
        : _api.getByCode(widget.barcode.data);
  }

  void _retry() {
    setState(() {
      _future = _api.getByCode(widget.barcode.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.barcode.description),
        leading: !context.canPop()
            ? IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => context.go('/'),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BarcodeItemWidget(barcode: widget.barcode),
            const SizedBox(width: 16),
            Expanded(
              child: SingleChildScrollView(
                child: _buildJson(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJson() {
    return FutureBuilder<dynamic>(
      future: _future,
      builder: (context, snapshot) {
        final t = Translations.of(context);
        if (snapshot.connectionState != ConnectionState.done) {
          return Text(t.details.loading);
        }
        if (snapshot.hasError) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                t.details.error(error: snapshot.error.toString()),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _retry,
                icon: const Icon(Icons.refresh),
                label: Text(t.details.retry),
              ),
            ],
          );
        }
        final data = snapshot.data;
        if (data == null) {
          return Text(t.details.noData);
        }
        const encoder = JsonEncoder.withIndent('  ');
        final pretty = encoder.convert(data);
        return SelectableText(
          pretty,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
          ),
        );
      },
    );
  }
}

