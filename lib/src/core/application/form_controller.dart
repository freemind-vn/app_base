import 'package:flutter/services.dart';

import 'package:app/core.dart';

extension StreamSigninValidateEventExtension on Stream<FormValidateEvent> {
  Stream<FormValidateEvent> byField<T>(T field) {
    return where((event) => event.field == field);
  }
}

class FormInput<T> {
  T? value;
  String? Function(T)? validator;
  List<TextInputFormatter>? inputFormatters;
  void Function(T)? onChanged;
  FormInput({this.value, this.validator, this.inputFormatters});
}

class FormController<T extends Enum> extends Controller {
  List<FormInput?> _fields = [];

  FormInput? getInput(T field) => _fields[field.index];

  FormController(List<T> field) {
    _fields = List.filled(field.length, null);
    _isValid = _validAll & 0xffff << field.length;
  }

  FormInput<X> register<X>(T field, FormInput<X> formInput) {
    if (_fields[field.index] == null) {
      formInput.onChanged = (value) {
        formInput.value = value;
        final message = formInput.validator?.call(value);
        send(FormValidateEvent(
          field: field,
          status: message == null ? EventStatus.success : EventStatus.error,
          message: message,
        ));
        _updateValidate(field, message == null);
      };
      _fields[field.index] = formInput;
    }
    return _fields[field.index] as FormInput<X>;
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

      if (_isValid == _validAll) {
        send(FormValidateEvent());
      }
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
