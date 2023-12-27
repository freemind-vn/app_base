import 'package:app_base/app_base.dart';

enum FormFieldEventType { init, validate }

class FormFieldEvent<T> extends BaseEvent {
  final FormFieldController<T>? field;
  final FormFieldEventType type;

  FormFieldEvent({
    super.status,
    this.type = FormFieldEventType.validate,
    this.field,
    super.message,
  });
}

class FormSubmitEvent {
  final Map<String, dynamic> data;
  FormSubmitEvent(this.data);
}
