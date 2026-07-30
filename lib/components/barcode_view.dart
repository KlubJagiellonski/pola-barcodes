import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../barcode_item.dart';
import '../barcode_type.dart';
import '../i18n/strings.g.dart';

class BarcodeView extends StatelessComponent {
  const BarcodeView({
    super.key,
    required this.barcode,
  });

  final BarcodeItem barcode;

  @override
  Component build(BuildContext context) {
    return div(classes: 'barcode-view', [
      span(classes: 'barcode-description', [.text(barcode.description)]),
      _barcodeSvg(),
    ]);
  }

  Component _barcodeSvg() {
    if (barcode.data.isEmpty || !barcode.type.barcode.isValid(barcode.data)) {
      return span(classes: 'barcode-error', [.text(t.error.invalidCode)]);
    }
    final isQr = barcode.type == BarcodeType.qr;
    return div(classes: isQr ? 'barcode-svg qr' : 'barcode-svg', [
      RawText(barcode.type.barcode.toSvg(
        barcode.data,
        width: isQr ? 100 : 200,
        height: 100,
      )),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.barcode-view', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        alignItems: .start,
        gap: .all(6.px),
      ),
      css('.barcode-description').styles(
        fontSize: 17.px,
        fontWeight: .bold,
      ),
      css('.barcode-error').styles(
        color: Colors.red,
      ),
      css('.barcode-svg svg').styles(
        width: 200.px,
        height: 100.px,
      ),
      css('.barcode-svg.qr svg').styles(
        width: 100.px,
      ),
    ]),
  ];
}
