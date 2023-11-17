import 'package:app/core.dart';

class SigninValidateEvent {
  final EventStatus status;
  final int? field;
  final String? message;

  SigninValidateEvent({required this.status, this.field, this.message});
}

class SigninSubmitEvent {
  final String username;
  final String password;

  SigninSubmitEvent({required this.username, required this.password});
}
