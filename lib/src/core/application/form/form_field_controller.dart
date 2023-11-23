import 'package:flutter/services.dart';

import 'package:app/core.dart';

class FormFieldController<T> extends Controller<FormFieldEvent> {
  T? value;
  String? Function(T)? validator;
  List<TextInputFormatter>? inputFormatters;
  FormFieldController({this.value, this.validator, this.inputFormatters});
  void onChanged(T value) {
    this.value = value;
    final message = validator?.call(value);
    send(FormFieldEvent(
      field: this,
      status: message == null ? EventStatus.success : EventStatus.error,
      message: message,
    ));
  }
}

extension FormInputExtension on FormFieldController {
  byType(FormFieldEventType type) {
    return stream.where((event) => event.type == type);
  }
}
