import 'package:flutter/material.dart';

class SignInController {
  final username = TextEditingController();
  final password = TextEditingController();

  final isValid = ValueNotifier(false);
  login() {
    print('username: ${username.text}, password: ${password.text}');
  }

  onChange(String value) {
    isValid.value = (username.text != '' && password.text != '');
  }
}
