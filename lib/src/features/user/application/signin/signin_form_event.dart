import 'package:app/core.dart';

enum SigninFormField { username, password, all }

class SigninValidateEvent extends BaseEvent {
  final SigninFormField? field;
  final String? message;

  SigninValidateEvent({required super.status, this.field, this.message});
}

class SigninSubmitEvent {
  final String username;
  final String password;

  SigninSubmitEvent({required this.username, required this.password});
}
