import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/src/features/user.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final controller = Modular.get<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: Modular.to.pop,
        ),
        title: const Text('Signin'),
      ),
      body: Center(
        child: SignInForm(
          onChange: controller.onChange,
          onSubmit: controller.login,
        ),
      ),
    );
  }
}
