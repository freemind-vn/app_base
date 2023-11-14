import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:app_base/app_base.dart';

class FormController<T extends Enum> extends Controller {
  List<FormFieldController?> _fields = [];

  FormFieldController<X>? getInput<X>(T field) =>
      _fields[field.index] as FormFieldController<X>;

  FormController(List<T> field) {
    _fields = List.filled(field.length, null);
    _isValid = _validAll & 0xffff << field.length;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _init();
    });
  }

  _init() {
    for (var i = 0; i < _fields.length; i++) {
      // field null: auto valid
      if (_fields[i] == null) {
        _updateValid(i, true);
        continue;
      }
      _fields[i]!.send(FormFieldEvent(
        type: FormFieldEventType.init,
        field: _fields[i],
      ));
    }
  }

  Stream<FormFieldEvent> register(T field, FormFieldController formInput) {
    if (_fields[field.index] == null) {
      formInput.byType(FormFieldEventType.validate).listen(
        (event) {
          _updateValid(field.index, event.message == null);
        },
      );
      _fields[field.index] = formInput;
    }
    return _fields[field.index]!.stream;
  }

  static const _validAll = 0xffff;
  int _isValid = 0;

  _updateValid(int index, bool valid) {
    final fieldBit = 1 << index;
    final currentState = (_isValid & fieldBit == fieldBit);
    // check state and update if needed
    if (valid != currentState) {
      if (!valid) {
        _isValid ^= fieldBit;
      } else {
        _isValid |= fieldBit;
      }

      send(FormFieldEvent());
    }
  }

  bool _isValidByIndex([int? index]) {
    if (index == null) {
      return _isValid == _validAll;
    }
    final fieldBit = 1 << index;
    return (_isValid & fieldBit == fieldBit);
  }

  bool isValid([T? field]) {
    return _isValidByIndex(field?.index);
  }

  bool validate([T? field]) {
    if (field != null) {
      final v = getInput(field)?.validate() ?? true;
      _updateValid(field.index, v);
      return v;
    }
    for (var i = 0; i < _fields.length; i++) {
      final v = (_fields[i]?.validate() ?? true);
      _updateValid(i, v);
    }
    return isValid();
  }
}
