import 'package:flutter/material.dart';
import ' i18n/strings.g.dart';
import 'barcode_item.dart';
import 'barcodes_page.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized(); 
   LocaleSettings.useDeviceLocale();
   runApp(TranslationProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:  (Translations.of(context).app_title),
      home: BarcodesPage(barcodes: BarcodeItem.barcodes(Translations.of(context))),
    );
  }
}
