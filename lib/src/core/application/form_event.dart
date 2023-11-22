import 'package:app/core.dart';

class FormValidateEvent<T extends Enum> extends BaseEvent {
  final T? field;

  FormValidateEvent({super.status, this.field, super.message});
}

class FormSubmitEvent {
  final Map<String, dynamic> data;
  FormSubmitEvent(this.data);
}
