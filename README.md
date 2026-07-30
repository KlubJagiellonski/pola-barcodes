# pola_barcodes

A [Jaspr](https://github.com/schultek/jaspr) web application for displaying and managing barcodes used in the Pola project.
The site is statically pre-rendered at build time and hydrated on the client.

**Live app:** https://klubjagiellonski.github.io/pola-barcodes/

## Internationalization (i18n)

This project uses [slang](https://pub.dev/packages/slang) for internationalization.
Translation source files are located in `lib/i18n/` (e.g. `en.i18n.json`, `pl.i18n.json`).

The generated Dart file (`lib/i18n/strings.g.dart`) is **not** committed to the repository.
It must be generated before building or running the app:

```bash
dart pub get
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
- https://klubjagiellonski.github.io/pola-barcodes/code/qr

### Custom codes

You can quickly create a custom barcode by using the EAN-13 or EAN-8 path:

- **EAN-13:** https://klubjagiellonski.github.io/pola-barcodes/ean13/4006381333931
- **EAN-8:** https://klubjagiellonski.github.io/pola-barcodes/ean8/55123457

### Adding a description

You can also add a description to any code using the `description` query parameter:

- https://klubjagiellonski.github.io/pola-barcodes/ean8/55123457?description=exampleDescription

## Development

Requires the [Dart SDK](https://dart.dev/get-dart) (>= 3.10) and the Jaspr CLI:

```bash
dart pub global activate jaspr_cli
```

Then:

```bash
dart pub get
dart run slang
dart run build_runner build --delete-conflicting-outputs
jaspr serve
```

The app is served at http://localhost:8080 with hot reload.

## Building

```bash
dart pub get
dart run slang
jaspr build --dart-define=BASE_PATH=/pola-barcodes/
```

The static site is generated into `build/jaspr/`. The `BASE_PATH` define sets the
`<base href>` for hosting under a sub-path (GitHub Pages project site); omit it
when hosting at the domain root.
