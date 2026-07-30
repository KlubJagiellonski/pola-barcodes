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
    this.code,
  });

  final String description;
  final String data;
  final BarcodeType type;

  /// The key under which this barcode is registered in [barcodes], e.g.
  /// `companyNotVerified`. Only set for predefined barcodes; `null` for
  /// user-added ones. Used to link to the pre-rendered `/code/<code>` route
  /// instead of an ad-hoc `/ean13|ean8/<data>` route.
  @JsonKey(includeIfNull: false)
  final String? code;

  factory BarcodeItem.fromJson(Map<String, dynamic> json) =>
      _$BarcodeItemFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeItemToJson(this);

  static Map<String, BarcodeItem> barcodes(Translations translations) {
    return {
      'companyNotVerified': BarcodeItem(
          description: translations.barcodesDescription.companyNotVerified,
          data: "5905499300707",
          type: BarcodeType.ean13,
          code: 'companyNotVerified'),
      'companyVerifiedWithFullScores': BarcodeItem(
          description:
              translations.barcodesDescription.companyVerifiedWithFullScores,
          data: "5907632637572",
          type: BarcodeType.ean13,
          code: 'companyVerifiedWithFullScores'),
      'companyVerifiedWithIncompleteScores': BarcodeItem(
          description: translations
              .barcodesDescription.companyVerifiedWithIncompleteScores,
          data: "5900497025454",
          type: BarcodeType.ean13,
          code: 'companyVerifiedWithIncompleteScores'),
      'internalCode': BarcodeItem(
          description: translations.barcodesDescription.internalCode,
          data: "00000000",
          type: BarcodeType.ean8,
          code: 'internalCode'),
      'companyRegisteredOutsidePoland': BarcodeItem(
          description:
              translations.barcodesDescription.companyRegisteredOutsidePoland,
          data: "8680861069075",
          type: BarcodeType.ean13,
          code: 'companyRegisteredOutsidePoland'),
      'companyRegisteredIn': BarcodeItem(
          description: translations.barcodesDescription.companyRegisteredIn,
          data: "5090000000006",
          type: BarcodeType.ean13,
          code: 'companyRegisteredIn'),
      'lidlOwnBrand': BarcodeItem(
          description: translations.barcodesDescription.lidlOwnBrand,
          data: "20982515",
          type: BarcodeType.ean8,
          code: 'lidlOwnBrand'),
      'polaFriend': BarcodeItem(
          description: translations.barcodesDescription.polaFriend,
          data: "5906395053018",
          type: BarcodeType.ean13,
          code: 'polaFriend'),
      'extendedCompanyDescription': BarcodeItem(
          description:
              translations.barcodesDescription.extendedCompanyDescription,
          data: "9771644705002",
          type: BarcodeType.ean13,
          code: 'extendedCompanyDescription'),
      'qr': BarcodeItem(
          description: translations.barcodesDescription.qr,
          data: "https://www.pola-app.pl/",
          type: BarcodeType.qr,
          code: 'qr'),
    };
  }
}
