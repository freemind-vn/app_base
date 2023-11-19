import 'package:app/core.dart';
import 'package:app/user.dart';

class AuthorizeEvent extends BaseEvent {
  final String message;
  final User? user;

  AuthorizeEvent({required super.status, required this.message, this.user});
}
