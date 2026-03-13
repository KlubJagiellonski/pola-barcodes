import 'package:freezed_annotation/freezed_annotation.dart';
import 'barcode_type.dart';
import 'i18n/strings.g.dart';

part 'barcode_item.freezed.dart';
part 'barcode_item.g.dart';

@freezed
class BarcodeItem with _$BarcodeItem {
  const BarcodeItem._();

  const factory BarcodeItem({
    required String description,
    required String data,
    required BarcodeType type,
  }) = _BarcodeItem;

  factory BarcodeItem.fromJson(Map<String, dynamic> json) =>
      _$BarcodeItemFromJson(json);

  static List<BarcodeItem> barcodes(Translations translations) {
    return [
      BarcodeItem(
          description: translations.barcodesDescription.companyNotVerified,
          data: "5905499300707",
          type: BarcodeType.ean13),
      BarcodeItem(
          description:
              translations.barcodesDescription.companyVerifiedWithFullScores,
          data: "5907632637572",
          type: BarcodeType.ean13),
      BarcodeItem(
          description: translations
              .barcodesDescription.companyVerifiedWithIncompleteScores,
          data: "5900497025454",
          type: BarcodeType.ean13),
      BarcodeItem(
          description: translations.barcodesDescription.internalCode,
          data: "00000000",
          type: BarcodeType.ean8),
      BarcodeItem(
          description:
              translations.barcodesDescription.companyRegisteredOutsidePoland,
          data: "8680861069075",
          type: BarcodeType.ean13),
      BarcodeItem(
          description: translations.barcodesDescription.companyRegisteredIn,
          data: "5090000000006",
          type: BarcodeType.ean13),
      BarcodeItem(
          description: translations.barcodesDescription.lidlOwnBrand,
          data: "20982515",
          type: BarcodeType.ean8),
      BarcodeItem(
          description: translations.barcodesDescription.polaFriend,
          data: "5906395053018",
          type: BarcodeType.ean13),
      BarcodeItem(
          description:
              translations.barcodesDescription.extendedCompanyDescription,
          data: "9771644705002",
          type: BarcodeType.ean13),
    ];
  }
}
