import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../barcode_item.dart';
import '../barcode_storage.dart';
import '../barcode_type.dart';
import '../components/barcodes_list_view.dart';
import '../components/barcodes_panel.dart';
import '../components/header.dart';
import '../i18n/strings.g.dart';

class BarcodesPage extends StatefulComponent {
  const BarcodesPage({
    super.key,
    required this.barcodes,
  });

  final List<BarcodeItem> barcodes;

  @override
  State<BarcodesPage> createState() => BarcodesPageState();
}

class BarcodesPageState extends State<BarcodesPage> {
  List<BarcodeItem> _userBarcodes = [];

  List<BarcodeItem> get _allBarcodes => [...component.barcodes, ..._userBarcodes];

  @override
  void initState() {
    super.initState();
    // localStorage only exists in the browser; the pre-rendered page contains
    // just the predefined barcodes.
    if (kIsWeb) {
      _userBarcodes = loadBarcodesFromStorage() ?? [];
    }
  }

  void _addBarcode(String description, String data, BarcodeType type) {
    if (description.isNotEmpty && data.isNotEmpty) {
      setState(() {
        _userBarcodes.add(
          BarcodeItem(
            description: description,
            data: data,
            type: type,
          ),
        );
        saveBarcodesToStorage(_userBarcodes);
      });
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'page', [
      Header(title: t.barcodeList),
      div(classes: 'page-content', [
        BarcodesListView(barcodes: _allBarcodes),
      ]),
      BarcodesPanel(onAddBarcode: _addBarcode),
    ]);
  }
}
