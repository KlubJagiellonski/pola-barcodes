import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'barcode_item.dart';
import 'barcode_type.dart';
import 'i18n/strings.g.dart';
import 'pages/barcode_detail_page.dart';
import 'pages/barcodes_page.dart';

@client
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    final barcodes = BarcodeItem.barcodes(t);
    return Router(routes: [
      Route(
        path: '/',
        title: t.appTitle,
        builder: (context, state) => BarcodesPage(barcodes: barcodes.values.toList()),
      ),
      // Each predefined barcode gets an explicit route, so it is pre-rendered
      // to its own HTML file during the static build.
      for (final entry in barcodes.entries)
        Route(
          path: '/code/${entry.key}',
          title: entry.value.description,
          builder: (context, state) => BarcodeDetailPage(barcode: entry.value),
        ),
      // Routes with path parameters cannot be statically generated, so they
      // exist only on the client.
      if (kIsWeb) ...[
        Route(
          path: '/code/:name',
          builder: (context, state) => BarcodeDetailPage(
            barcode: BarcodeItem(
              description: t.barcodeNotFound(data: state.params['name']!),
              data: '',
              type: BarcodeType.ean13,
            ),
          ),
        ),
        Route(
          path: '/ean13/:data',
          builder: (context, state) => _customBarcodePage(state, BarcodeType.ean13),
        ),
        Route(
          path: '/ean8/:data',
          builder: (context, state) => _customBarcodePage(state, BarcodeType.ean8),
        ),
      ],
    ]);
  }

  Component _customBarcodePage(RouteState state, BarcodeType type) {
    final data = state.params['data']!;
    final description = state.queryParams['description'] ?? data;
    return BarcodeDetailPage(
      barcode: BarcodeItem(
        description: description,
        data: data,
        type: type,
      ),
    );
  }

  @css
  static List<StyleRule> get styles => [
    css('.page').styles(
      display: .flex,
      height: 100.vh,
      flexDirection: .column,
    ),
    css('.page-content').styles(
      padding: .all(8.px),
      overflow: const Overflow.only(y: .auto),
      flex: const Flex(grow: 1),
    ),
  ];
}
