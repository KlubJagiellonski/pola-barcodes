# pola_barcodes

A Flutter web application for displaying and managing barcodes used in the Pola project.

**Live app:** https://klubjagiellonski.github.io/pola-barcodes/

## Internationalization (i18n)

This project uses [slang](https://pub.dev/packages/slang) for internationalization.
Translation source files are located in `lib/i18n/` (e.g. `strings.i18n.json`, `strings-pl.i18n.json`).

The generated Dart file (`lib/i18n/strings.g.dart`) is **not** committed to the repository.
It must be generated before building or running the app:

```bash
flutter pub get
dart run slang
```

This project also uses [json_serializable](https://pub.dev/packages/json_serializable) for JSON serialization.
The generated file (`lib/barcode_item.g.dart`) is **not** committed to the repository and must also be generated:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Development

```bash
flutter pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
flutter run -d chrome
```

## Building

```bash
flutter pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
flutter build web
```
