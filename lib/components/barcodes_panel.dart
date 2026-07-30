import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../barcode_type.dart';
import '../i18n/strings.g.dart';

class BarcodesPanel extends StatefulComponent {
  const BarcodesPanel({
    super.key,
    required this.onAddBarcode,
  });

  final void Function(String description, String data, BarcodeType type) onAddBarcode;

  @override
  State<BarcodesPanel> createState() => BarcodesPanelState();
}

class BarcodesPanelState extends State<BarcodesPanel> {
  String _description = '';
  String _data = '';
  BarcodeType _selectedType = BarcodeType.ean13;

  String? _descriptionError;
  String? _dataError;

  void _handleAddBarcode() {
    setState(() {
      _descriptionError = _description.isEmpty ? t.error.emptyDescription : null;
      _dataError = _data.isEmpty ? t.error.emptyCode : null;

      if (_descriptionError == null && _dataError == null) {
        if (_selectedType.barcode.isValid(_data)) {
          component.onAddBarcode(_description, _data, _selectedType);
          _description = '';
          _data = '';
        } else {
          _dataError = t.error.invalidCode;
        }
      }
    });
  }

  Component _textField({
    required String label,
    required String value,
    required ValueChanged<String> onInput,
    String? errorText,
  }) {
    return div(classes: 'panel-field', [
      label_(label),
      input<String>(
        type: .text,
        value: value,
        onInput: onInput,
      ),
      _errorText(errorText),
    ]);
  }

  Component _dropdownField() {
    final selectableTypes = BarcodeType.values.where((type) => type != BarcodeType.qr);
    return div(classes: 'panel-field', [
      label_(t.codeType),
      select(
        value: _selectedType.name,
        onInput: (values) {
          setState(() {
            _selectedType = BarcodeType.values.byName(values.first);
          });
        },
        [
          for (final type in selectableTypes)
            option(
              value: type.name,
              selected: type == _selectedType,
              [.text(type.displayName)],
            ),
        ],
      ),
      _errorText(null),
    ]);
  }

  Component label_(String text) => span(classes: 'field-label', [.text(text)]);

  Component _errorText(String? errorText) => span(classes: 'field-error', [
    if (errorText != null) .text(errorText),
  ]);

  @override
  Component build(BuildContext context) {
    return div(classes: 'barcodes-panel', [
      _textField(
        label: t.description,
        value: _description,
        onInput: (value) => _description = value,
        errorText: _descriptionError,
      ),
      _textField(
        label: t.code,
        value: _data,
        onInput: (value) => _data = value,
        errorText: _dataError,
      ),
      _dropdownField(),
      div(classes: 'panel-field', [
        _errorText(null),
        button(classes: 'add-button', onClick: _handleAddBarcode, [
          .text(t.addCode),
        ]),
        _errorText(null),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.barcodes-panel', [
      css('&').styles(
        display: .flex,
        padding: .all(8.px),
        flexWrap: .wrap,
        alignItems: .end,
        gap: .all(10.px),
      ),
      css('.panel-field').styles(
        display: .flex,
        minWidth: 140.px,
        flexDirection: .column,
        gap: .all(4.px),
        flex: const Flex(grow: 1, basis: .auto),
      ),
      css('.field-label').styles(
        color: const Color('#5f6368'),
        fontSize: 12.px,
      ),
      css('input, select').styles(
        height: 36.px,
        padding: .symmetric(horizontal: 8.px),
        border: .all(style: .solid, color: const Color('#9aa0a6'), width: 1.px),
        radius: .circular(4.px),
        fontSize: 15.px,
        backgroundColor: Colors.white,
      ),
      css('.field-error').styles(
        minHeight: 16.px,
        color: Colors.red,
        fontSize: 12.px,
      ),
      css('.add-button', [
        css('&').styles(
          height: 36.px,
          padding: .symmetric(horizontal: 16.px),
          border: .none,
          radius: .circular(18.px),
          cursor: .pointer,
          color: Colors.white,
          fontSize: 14.px,
          fontWeight: .w500,
          backgroundColor: const Color('#0175C2'),
        ),
        css('&:hover').styles(
          backgroundColor: const Color('#015fa0'),
        ),
      ]),
    ]),
  ];
}
