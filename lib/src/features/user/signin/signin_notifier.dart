import 'dart:developer';

import 'package:flutter/material.dart';

import 'signin_repository.dart';

class SignInNotifier {
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
