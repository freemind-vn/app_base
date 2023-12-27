import 'package:flutter/services.dart';

import 'package:app_base/app_base.dart';

class FormFieldController<T> extends Controller<FormFieldEvent> {
  T? value;
  String? Function(T?)? validator;
  List<TextInputFormatter>? inputFormatters;
  bool validateOnChanged;
  FormFieldController(
      {this.value,
      this.validator,
      this.inputFormatters,
      this.validateOnChanged = true});
  void onChanged(T? value) {
    this.value = value;
    if (validateOnChanged) {
      validate();
    }
  }

  bool validate() {
    final message = validator?.call(value);
    send(FormFieldEvent(
      field: this,
      status: message == null ? EventStatus.success : EventStatus.error,
      message: message,
    ));
    return message == null;
  }
}

extension FormInputExtension on FormFieldController {
  byType(FormFieldEventType type) {
    return stream.where((event) => event.type == type);
  }
}
