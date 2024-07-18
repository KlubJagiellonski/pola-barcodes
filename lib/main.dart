import 'package:flutter/material.dart';
import 'i18n/strings.g.dart';
import 'barcode_item.dart';
import 'barcodes_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final translations = Translations.of(context);
    return MaterialApp(
      title: (translations.appTitle),
      home: BarcodesPage(
          barcodes: BarcodeItem.barcodes(translations)),
    );
  }
}
