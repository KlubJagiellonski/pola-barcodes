import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'barcode_item.dart';

const _storageKey = 'pola_barcodes';

List<BarcodeItem>? loadBarcodesFromStorage() {
  final raw = html.window.localStorage[_storageKey];
  if (raw == null) return null;
  try {
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((e) => BarcodeItem.fromJson(e as Map<String, dynamic>))
        .toList();
  } on FormatException {
    return null;
  } on TypeError {
    return null;
  }
}

void saveBarcodesToStorage(List<BarcodeItem> barcodes) {
  final encoded =
      jsonEncode(barcodes.map((e) => e.toJson()).toList());
  html.window.localStorage[_storageKey] = encoded;
}
