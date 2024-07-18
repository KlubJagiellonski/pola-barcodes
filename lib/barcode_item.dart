import 'package:barcode_widget/barcode_widget.dart';
import 'i18n/strings.g.dart';

class BarcodeItem {
  final String description;
  final String data;
  final Barcode type;

  BarcodeItem({
    required this.description,
    required this.data,
    required this.type,
  });

  static List<BarcodeItem> barcodes(Translations translations) {
    return [
      BarcodeItem(
          description: translations.barcodesDescription.companyNotVerified,
          data: "5905499300707",
          type: Barcode.ean13()),
      BarcodeItem(
          description:
              translations.barcodesDescription.companyVerifiedWithFullScores,
          data: "5907632637572",
          type: Barcode.ean13()),
      BarcodeItem(
          description: translations
              .barcodesDescription.companyVerifiedWithIncompleteScores,
          data: "5900497025454",
          type: Barcode.ean13()),
      BarcodeItem(
          description: translations.barcodesDescription.internalCode,
          data: "00000000",
          type: Barcode.ean8()),
      BarcodeItem(
          description:
              translations.barcodesDescription.companyRegisteredOutsidePoland,
          data: "8680861069075",
          type: Barcode.ean13()),
      BarcodeItem(
          description: translations.barcodesDescription.companyRegisteredIn,
          data: "5090000000006",
          type: Barcode.ean13()),
      BarcodeItem(
          description: translations.barcodesDescription.lidlOwnBrand,
          data: "20982515",
          type: Barcode.ean8()),
      BarcodeItem(
          description: translations.barcodesDescription.polaFriend,
          data: "5906395053018",
          type: Barcode.ean13()),
      BarcodeItem(
          description:
              translations.barcodesDescription.extendedCompanyDescription,
          data: "9771644705002",
          type: Barcode.ean13()),
    ];
  }
}
