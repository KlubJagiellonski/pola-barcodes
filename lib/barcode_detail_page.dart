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
        if (snapshot.connectionState != ConnectionState.done) {
          return const _LoadingView();
        }
        if (snapshot.hasError) {
          return _ErrorView(
            error: snapshot.error!,
            onRetry: _retry,
          );
        }
        return _JsonView(data: snapshot.data);
      },
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 8),
        Text(t.details.loading),
      ],
    );
  }
}

class _ErrorView extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _ErrorView({required this.error, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(t.details.error(error: error.toString())),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: Text(t.details.retry),
        ),
      ],
    );
  }
}

class _JsonView extends StatelessWidget {
  final dynamic data;

  const _JsonView({required this.data});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
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
  }
}

