import 'dart:convert';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../barcode_item.dart';
import '../barcode_type.dart';
import '../components/barcode_view.dart';
import '../components/header.dart';
import '../i18n/strings.g.dart';
import '../pola_api.dart';

class BarcodeDetailPage extends StatefulComponent {
  const BarcodeDetailPage({
    super.key,
    required this.barcode,
    this.api,
  });

  final BarcodeItem barcode;
  final PolaApi? api;

  @override
  State<BarcodeDetailPage> createState() => BarcodeDetailPageState();
}

class BarcodeDetailPageState extends State<BarcodeDetailPage> {
  late final PolaApi _api;
  bool _loading = true;
  Object? _error;
  dynamic _data;

  BarcodeItem get _barcode => component.barcode;

  bool get _hasApiData => _barcode.data.isNotEmpty && _barcode.type != BarcodeType.qr;

  @override
  void initState() {
    super.initState();
    _api = component.api ?? PolaApi();
    // The API is only queried in the browser; the pre-rendered page shows the
    // loading state, so the data is always fetched fresh.
    if (kIsWeb && _hasApiData) {
      _fetch();
    }
  }

  Future<void> _fetch() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final data = await _api.getByCode(_barcode.data);
      setState(() {
        _data = data;
        _loading = false;
      });
    } catch (error) {
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: 'page', [
      Header(title: _barcode.description, showHomeLink: true),
      div(classes: 'page-content detail-content', [
        BarcodeView(barcode: _barcode),
        div(classes: 'detail-json', [_buildJson()]),
      ]),
    ]);
  }

  Component _buildJson() {
    if (_barcode.type == BarcodeType.qr) {
      return p([.text(t.details.qrMessage)]);
    }
    if (_barcode.data.isEmpty) {
      return p([.text(t.details.noData)]);
    }
    if (_error != null) {
      return div(classes: 'error-view', [
        p([.text(t.details.error(error: _error.toString()))]),
        button(classes: 'retry-button', onClick: _fetch, [
          .text('⟳ ${t.details.retry}'),
        ]),
      ]);
    }
    if (_loading) {
      return div(classes: 'loading-view', [
        span(classes: 'spinner', []),
        span([.text(t.details.loading)]),
      ]);
    }
    if (_data == null) {
      return p([.text(t.details.noData)]);
    }
    return pre(classes: 'json-view', [
      .text(const JsonEncoder.withIndent('  ').convert(_data)),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.detail-content', [
      css('&').styles(
        display: .flex,
        padding: .all(16.px),
        flexWrap: .wrap,
        alignItems: .start,
        gap: .all(16.px),
      ),
      css('.detail-json').styles(
        minWidth: 280.px,
        flex: Flex(grow: 1, basis: 320.px),
      ),
      css('.detail-json p').styles(
        margin: .zero,
        fontSize: 16.px,
      ),
      css('.json-view').styles(
        margin: .zero,
        overflow: const Overflow.only(x: .auto),
        fontSize: 14.px,
      ),
      css('.loading-view').styles(
        display: .flex,
        alignItems: .center,
        gap: .all(8.px),
      ),
      css('.spinner').styles(
        display: .inlineBlock,
        width: 16.px,
        height: 16.px,
        border: .all(style: .solid, color: const Color('#0175C2'), width: 2.px),
        radius: .circular(50.percent),
        raw: {
          'border-top-color': 'transparent',
          'animation': 'spin 800ms linear infinite',
        },
      ),
      css('.retry-button', [
        css('&').styles(
          height: 36.px,
          padding: .symmetric(horizontal: 16.px),
          border: .none,
          radius: .circular(18.px),
          cursor: .pointer,
          color: Colors.white,
          fontSize: 14.px,
          backgroundColor: const Color('#0175C2'),
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#015fa0'),
        ),
      ]),
    ]),
    css.keyframes('spin', {
      'from': const Styles(raw: {'transform': 'rotate(0deg)'}),
      'to': const Styles(raw: {'transform': 'rotate(360deg)'}),
    }),
  ];
}
