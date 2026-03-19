import 'package:go_router/go_router.dart';
import 'barcode_item.dart';
import 'barcode_detail_page.dart';
import 'barcode_type.dart';
import 'barcodes_page.dart';

GoRouter createRouter(List<BarcodeItem> barcodes) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BarcodesPage(barcodes: barcodes),
      ),
      GoRoute(
        path: '/ean13/:data',
        builder: (context, state) {
          return _buildBarcodeDetailPage(state, BarcodeType.ean13);
        },
      ),
      GoRoute(
        path: '/ean8/:data',
        builder: (context, state) {
          return _buildBarcodeDetailPage(state, BarcodeType.ean8);
        },
      ),
    ],
  );
}

BarcodeDetailPage _buildBarcodeDetailPage(GoRouterState state, BarcodeType type) {
  final data = state.pathParameters['data']!;
  final description = state.uri.queryParameters['description'] ?? data;
  final barcode = BarcodeItem(
    description: description,
    data: data,
    type: type,
  );
  return BarcodeDetailPage(barcode: barcode);
}
