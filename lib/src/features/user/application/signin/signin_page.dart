import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'signin_controller.dart';

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
        child: SizedBox(
          width: 200,
          child: Column(
            children: [
              TextField(
                controller: controller.username,
                onChanged: controller.onChange,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: controller.password,
                onChanged: controller.onChange,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 5,
              ),
              ValueListenableBuilder(
                valueListenable: controller.isValid,
                builder: (context, isValid, child) {
                  return FilledButton(
                    onPressed: (isValid == true ? controller.login : null),
                    child: const Text('Login'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
