import 'package:app/core.dart';
import 'package:app/user.dart';

class AuthorizeEvent {
  final EventStatus status;
  final String message;
  final User? user;

  AuthorizeEvent({required this.status, required this.message, this.user});
}
