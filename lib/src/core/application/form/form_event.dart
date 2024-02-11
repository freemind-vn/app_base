import 'package:app_base/app_base.dart';

enum FormInputEventType { init, validate }

class FormInputEvent<T> extends BaseEvent {
  final FormInputController<T>? input;
  final FormInputEventType type;

  FormInputEvent({
    super.status,
    this.type = FormInputEventType.validate,
    this.input,
    super.message,
  });
}

class FormSubmitEvent {
  final Map<String, dynamic> data;
  FormSubmitEvent(this.data);
}
