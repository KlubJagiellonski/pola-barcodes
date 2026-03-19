import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'i18n/strings.g.dart';
import 'barcode_item.dart';
import 'barcode_detail_page.dart';
import 'barcode_type.dart';
import 'barcodes_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  usePathUrlStrategy();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoRouter? _router;
  List<BarcodeItem>? _barcodes;

  GoRouter _createRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BarcodesPage(barcodes: _barcodes!),
        ),
        GoRoute(
          path: '/ean13/:data',
          builder: (context, state) {
            final data = state.pathParameters['data']!;
            final description =
                state.uri.queryParameters['description'] ?? data;
            final barcode = BarcodeItem(
              description: description,
              data: data,
              type: BarcodeType.ean13,
            );
            return BarcodeDetailPage(barcode: barcode);
          },
        ),
        GoRoute(
          path: '/ean8/:data',
          builder: (context, state) {
            final data = state.pathParameters['data']!;
            final description =
                state.uri.queryParameters['description'] ?? data;
            final barcode = BarcodeItem(
              description: description,
              data: data,
              type: BarcodeType.ean8,
            );
            return BarcodeDetailPage(barcode: barcode);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);
    if (_router == null) {
      _barcodes = BarcodeItem.barcodes(translations);
      _router = _createRouter();
    }
    return MaterialApp.router(
      title: translations.appTitle,
      routerConfig: _router!,
    );
  }
}
