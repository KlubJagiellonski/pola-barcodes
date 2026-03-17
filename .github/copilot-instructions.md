# GitHub Copilot Instructions

## Project Overview

`pola-barcodes` is a Flutter web application for displaying and managing barcodes used in the [Pola](https://www.pola-app.pl/) project. The live app is hosted at https://klubjagiellonski.github.io/pola-barcodes/.

## Tech Stack

- **Framework:** Flutter (web target)
- **Language:** Dart
- **Key dependencies:**
  - [`barcode_widget`](https://pub.dev/packages/barcode_widget) — renders EAN-8, EAN-13 and other barcode types
  - [`slang`](https://pub.dev/packages/slang) / [`slang_flutter`](https://pub.dev/packages/slang_flutter) — compile-time internationalization (i18n)

## Project Structure

```
lib/
  main.dart                  # App entry point; sets up locale and TranslationProvider
  barcode_item.dart          # BarcodeItem model; holds description, data string and Barcode type
  barcode_item.g.dart        # Generated — do NOT edit manually (from json_serializable)
  barcode_item_widget.dart   # Widget that renders a single BarcodeItem
  barcodes_list_view.dart    # Scrollable list of BarcodeItem widgets
  barcodes_page.dart         # Main page (Scaffold); contains list + add-barcode panel
  barcodes_panel.dart        # Form panel for adding a new barcode
  barcode_type.dart          # Helpers/enums for supported barcode types
  i18n/
    en.i18n.json             # English translations (base locale)
    pl.i18n.json             # Polish translations
    strings.g.dart           # Generated — do NOT edit manually (excluded from analysis)
```

## Internationalization

Translations live in `lib/i18n/*.i18n.json`. The base locale is **English** (`en`).  
The generated file `lib/i18n/strings.g.dart` is **not** committed; regenerate it with:

```bash
dart run slang
```

Access translations in widgets via `Translations.of(context)` or pass a `Translations` instance explicitly when a `BuildContext` is unavailable (e.g., in `BarcodeItem.barcodes(translations)`).

## Common Commands

```bash
# Install dependencies
flutter pub get

# Generate i18n code (required before build/run)
dart run slang

# Generate JSON serialization code (required before build/run)
dart run build_runner build --delete-conflicting-outputs

# Run in Chrome (development)
flutter run -d chrome

# Analyze (lint)
flutter analyze

# Build for web
flutter build web
```

## Coding Conventions

- Follow standard Flutter/Dart style enforced by `flutter_lints`.
- Use `const` constructors wherever possible.
- Widget files are named after the widget they contain, in `snake_case` (e.g., `barcode_item_widget.dart` for `BarcodeItemWidget`).
- Pass `Translations` explicitly to non-widget classes instead of reading from context.
- When adding or changing user-visible strings, update **both** `en.i18n.json` and `pl.i18n.json`, then regenerate `strings.g.dart`.
- The generated file `lib/i18n/strings.g.dart` is excluded from static analysis (see `analysis_options.yaml`).
