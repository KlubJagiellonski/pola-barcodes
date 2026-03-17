import 'dart:convert';
import 'package:web/web.dart' as web;
import 'barcode_item.dart';

const _storageKey = 'pola_barcodes';

List<BarcodeItem>? loadBarcodesFromStorage() {
  final raw = web.window.localStorage.getItem(_storageKey);
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
  web.window.localStorage.setItem(_storageKey, encoded);
}
