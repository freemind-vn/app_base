import 'package:flutter/material.dart';

import 'package:app/src/features/user.dart';

class SignInController {
  final user = ValueNotifier<User?>(null);

  final repository = SignInRepository();

  String _username = '';
  String _password = '';

  onChange(String username, String password) {
    _username = username;
    _password = password;
  }

  login() {
    user.value = repository.signIn(_username, _password);
  }
}
