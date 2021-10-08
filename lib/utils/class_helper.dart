import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MultiMaskedTextInputFormatter extends TextInputFormatter {
  late List<String>? _masks;
  late String? _separator;
  late String _prevMask;

  MultiMaskedTextInputFormatter(
      {@required List<String>? masks, @required String? separator}) {
    _separator = (separator != null && separator.isNotEmpty) ? separator : null;
    if (masks != null && masks.isNotEmpty) {
      _masks = masks;
      _masks!.sort((l, r) => l.length.compareTo(r.length));
      _prevMask = masks[0];
    }
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    final oldText = oldValue.text;

    if (newText.length == 0 ||
        newText.length < oldText.length ||
        _masks == null ||
        _separator == null) {
      return newValue;
    }

    final pasted = (newText.length - oldText.length).abs() > 1;
    final mask = _masks!.firstWhere((value) {
      final maskValue = pasted ? value.replaceAll(_separator!, '') : value;
      return newText.length <= maskValue.length;
    }, orElse: () => '');

    final needReset =
    (_prevMask != mask || newText.length - oldText.length > 1);
    _prevMask = mask;

    if (needReset) {
      final text = newText.replaceAll(_separator!, '');
      String resetValue = '';
      int sep = 0;

      for (int i = 0; i < text.length; i++) {
        if (mask[i + sep] == _separator) {
          resetValue += _separator!;
          ++sep;
        }
        resetValue += text[i];
      }

      return TextEditingValue(
          text: resetValue,
          selection: TextSelection.collapsed(
            offset: resetValue.length,
          ));
    }

    if (newText.length < mask.length &&
        mask[newText.length - 1] == _separator) {
      final text =
          '$oldText$_separator${newText.substring(newText.length - 1)}';
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(
          offset: text.length,
        ),
      );
    }

    return newValue;
  }
}