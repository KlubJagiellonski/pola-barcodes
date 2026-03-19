import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'i18n/strings.g.dart';
import 'barcode_item.dart';
import 'router.dart';

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

  @override
  Widget build(BuildContext context) {
    final translations = Translations.of(context);
    if (_router == null) {
      final barcodes = BarcodeItem.barcodes(translations);
      _router = createRouter(barcodes);
    }
    return MaterialApp.router(
      title: translations.appTitle,
      routerConfig: _router!,
    );
  }
}
