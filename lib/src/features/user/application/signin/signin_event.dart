import 'package:app/core.dart';

class AuthorizeEvent {
  final EventStatus status;
  final String message;

  AuthorizeEvent({required this.status, required this.message});
}
