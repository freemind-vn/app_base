import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:app_base/app_base.dart';

class FormInputController<T> extends Controller<FormInputEvent<T>> {
  T? value;
  String? Function(T?)? validator;
  List<TextInputFormatter>? inputFormatters;
  bool validateOnChanged;
  FormInputController({
    this.value,
    this.validator,
    this.inputFormatters,
    this.validateOnChanged = true,
  });
  void onChanged(T? value) {
    this.value = value;
    if (validateOnChanged) {
      validate();
    }
  }

  bool validate() {
    final message = validator?.call(value);
    send(FormInputEvent(
      input: this,
      status: message == null ? EventStatus.success : EventStatus.error,
      message: message,
    ));
    return message == null;
  }
}

extension FormInputExtension on FormInputController {
  byType(FormInputEventType type) {
    return stream.where((event) => event.type == type);
  }
}

class FormInputBuilder<T> extends StreamBuilderBase<FormInputEvent<T>,
    AsyncSnapshot<FormInputEvent<T>>> {
  final FormInputController<T> controller;
  final Widget Function(BuildContext, AsyncSnapshot<FormInputEvent<T>>) builder;
  final T? initialData;

  FormInputBuilder({
    required this.controller,
    required this.builder,
    this.initialData,
    super.key,
  }) : super(stream: controller.stream);

  @override
  afterData(current, FormInputEvent<T> data) {
    return AsyncSnapshot<FormInputEvent<T>>.withData(
      ConnectionState.active,
      data,
    );
  }

  @override
  Widget build(BuildContext context, currentSummary) {
    return builder(context, currentSummary);
  }

  @override
  AsyncSnapshot<FormInputEvent<T>> initial() {
    if (initialData != null) {
      controller.value = initialData;
    }
    return AsyncSnapshot<FormInputEvent<T>>.withData(ConnectionState.none,
        FormInputEvent<T>(type: FormInputEventType.init, input: controller));
  }
}
