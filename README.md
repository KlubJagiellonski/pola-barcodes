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

## URL Paths

The app supports several URL paths that make it easy to share specific barcodes.

### Predefined codes

You can share a predefined barcode by navigating to `/code/{codeName}`:

- https://klubjagiellonski.github.io/pola-barcodes/code/companyNotVerified
- https://klubjagiellonski.github.io/pola-barcodes/code/companyVerifiedWithFullScores
- https://klubjagiellonski.github.io/pola-barcodes/code/companyVerifiedWithIncompleteScores
- https://klubjagiellonski.github.io/pola-barcodes/code/internalCode
- https://klubjagiellonski.github.io/pola-barcodes/code/companyRegisteredOutsidePoland
- https://klubjagiellonski.github.io/pola-barcodes/code/companyRegisteredIn
- https://klubjagiellonski.github.io/pola-barcodes/code/lidlOwnBrand
- https://klubjagiellonski.github.io/pola-barcodes/code/polaFriend
- https://klubjagiellonski.github.io/pola-barcodes/code/extendedCompanyDescription

### Custom codes

You can quickly create a custom barcode by using the EAN-13 or EAN-8 path:

- **EAN-13:** https://klubjagiellonski.github.io/pola-barcodes/ean13/4006381333931
- **EAN-8:** https://klubjagiellonski.github.io/pola-barcodes/ean8/55123457

### Adding a description

You can also add a description to any code using the `description` query parameter:

- https://klubjagiellonski.github.io/pola-barcodes/ean8/55123457?description=exampleDescription

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
