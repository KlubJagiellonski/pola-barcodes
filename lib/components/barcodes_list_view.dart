import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import '../barcode_item.dart';
import '../barcode_type.dart';
import 'barcode_view.dart';

class BarcodesListView extends StatelessComponent {
  const BarcodesListView({
    super.key,
    required this.barcodes,
  });

  final List<BarcodeItem> barcodes;

  @override
  Component build(BuildContext context) {
    return div(classes: 'barcodes-grid', [
      for (final barcode in barcodes)
        Link(
          to: _pathFor(barcode),
          classes: 'barcode-tile',
          child: BarcodeView(barcode: barcode),
        ),
    ]);
  }

  String _pathFor(BarcodeItem barcode) {
    if (barcode.type == BarcodeType.qr) {
      return '/code/qr';
    }
    return '/${barcode.type.name}/${barcode.data}'
        '?description=${Uri.encodeComponent(barcode.description)}';
  }

  @css
  static List<StyleRule> get styles => [
    css('.barcodes-grid').styles(
      display: .grid,
      gap: .all(12.px),
      raw: {'grid-template-columns': 'repeat(2, minmax(0, 1fr))'},
    ),
    css('.barcode-tile').styles(
      padding: .symmetric(vertical: 4.px),
      color: .inherit,
      textDecoration: const TextDecoration(line: .none),
    ),
  ];
}
