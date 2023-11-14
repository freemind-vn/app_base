import 'package:app_base/app_base.dart';

import 'package:app/user.dart';

class AuthorizeEvent extends BaseEvent {
  final User? user;

  AuthorizeEvent({required super.status, required super.message, this.user});
}
