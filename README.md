# pola_barcodes

A Flutter web application for displaying and managing barcodes used in the Pola project.

## Internationalization (i18n)

This project uses [slang](https://pub.dev/packages/slang) for internationalization.
Translation source files are located in `lib/i18n/` (e.g. `strings.i18n.json`, `strings-pl.i18n.json`).

The generated Dart file (`lib/i18n/strings.g.dart`) is **not** committed to the repository.
It must be generated before building or running the app:

```bash
flutter pub get
dart run slang
```

## Development

```bash
flutter pub get
dart run slang
flutter run -d chrome
```

## Building

```bash
flutter pub get
dart run slang
flutter build web
```
