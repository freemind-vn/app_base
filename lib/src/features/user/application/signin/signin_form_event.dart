import 'package:app/core.dart';

enum SigninFormField { username, password, all }

class SigninValidateEvent {
  final EventStatus status;
  final SigninFormField? field;
  final String? message;

  SigninValidateEvent({required this.status, this.field, this.message});
}

class SigninSubmitEvent {
  final String username;
  final String password;

  SigninSubmitEvent({required this.username, required this.password});
}
