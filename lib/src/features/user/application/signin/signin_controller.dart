import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:app/src/features/user.dart';

class SignInController {
  final username = TextEditingController();
  final password = TextEditingController();

  final isValid = ValueNotifier(false);
  final user = ValueNotifier<User?>(null);

  final repository = SignInRepository();

  login() {
    user.value = repository.signIn('x', 'y');
    log(user.value?.username ?? '');
  }

  onChange(String value) {
    isValid.value = (username.text != '' && password.text != '');
  }
}
