import 'package:flutter/material.dart';

import 'package:app/user.dart';

class SignInController {
  final user = ValueNotifier<User?>(null);

  final repository = SignInRepository();

  login(String username, String password) {
    user.value = repository.signIn(username, password);
  }
}
