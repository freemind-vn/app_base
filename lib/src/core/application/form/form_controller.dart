import 'dart:async';

import 'package:flutter/widgets.dart';

import 'package:app/core.dart';

class FormController<T extends Enum> extends Controller {
  List<FormFieldController?> _fields = [];

  FormFieldController<X>? getInput<X>(T field) =>
      _fields[field.index] as FormFieldController<X>;

  FormController(List<T> field) {
    _fields = List.filled(field.length, null);
    _isValid = _validAll & 0xffff << field.length;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  init() {
    for (var element in _fields) {
      element?.send(FormFieldEvent(
        type: FormFieldEventType.init,
        field: element,
      ));
    }
  }

  Stream<FormFieldEvent> register(T field, FormFieldController formInput) {
    if (_fields[field.index] == null) {
      formInput.byType(FormFieldEventType.validate).listen(
        (event) {
          _updateValidate(field, event.message == null);
        },
      );
      _fields[field.index] = formInput;
    }
    return _fields[field.index]!.stream;
  }

  static const _validAll = 0xffff;
  int _isValid = 0;

  _updateValidate(T field, bool valid) {
    final fieldBit = 1 << field.index;
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

  isValid(T? field) {
    if (field == null) {
      return _isValid == _validAll;
    }
    final fieldBit = 1 << field.index;
    return (_isValid & fieldBit == fieldBit);
  }
}
