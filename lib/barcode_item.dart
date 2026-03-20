import 'package:json_annotation/json_annotation.dart';
import 'barcode_type.dart';
import 'i18n/strings.g.dart';

part 'barcode_item.g.dart';

@JsonSerializable()
class BarcodeItem {
  const BarcodeItem({
    required this.description,
    required this.data,
    required this.type,
  });

  final String description;
  final String data;
  final BarcodeType type;

  factory BarcodeItem.fromJson(Map<String, dynamic> json) =>
      _$BarcodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeItemToJson(this);

  static Map<String, BarcodeItem> barcodes(Translations translations) {
    return {
      'companyNotVerified': BarcodeItem(
          description: translations.barcodesDescription.companyNotVerified,
          data: "5905499300707",
          type: BarcodeType.ean13),
      'companyVerifiedWithFullScores': BarcodeItem(
          description:
              translations.barcodesDescription.companyVerifiedWithFullScores,
          data: "5907632637572",
          type: BarcodeType.ean13),
      'companyVerifiedWithIncompleteScores': BarcodeItem(
          description: translations
              .barcodesDescription.companyVerifiedWithIncompleteScores,
          data: "5900497025454",
          type: BarcodeType.ean13),
      'internalCode': BarcodeItem(
          description: translations.barcodesDescription.internalCode,
          data: "00000000",
          type: BarcodeType.ean8),
      'companyRegisteredOutsidePoland': BarcodeItem(
          description:
              translations.barcodesDescription.companyRegisteredOutsidePoland,
          data: "8680861069075",
          type: BarcodeType.ean13),
      'companyRegisteredIn': BarcodeItem(
          description: translations.barcodesDescription.companyRegisteredIn,
          data: "5090000000006",
          type: BarcodeType.ean13),
      'lidlOwnBrand': BarcodeItem(
          description: translations.barcodesDescription.lidlOwnBrand,
          data: "20982515",
          type: BarcodeType.ean8),
      'polaFriend': BarcodeItem(
          description: translations.barcodesDescription.polaFriend,
          data: "5906395053018",
          type: BarcodeType.ean13),
      'extendedCompanyDescription': BarcodeItem(
          description:
              translations.barcodesDescription.extendedCompanyDescription,
          data: "9771644705002",
          type: BarcodeType.ean13),
    };
  }
}
