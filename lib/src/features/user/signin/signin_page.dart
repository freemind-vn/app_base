import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/src/features/user/signin/signin_notifier.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final notifier = Modular.get<SignInNotifier>();

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
                controller: notifier.username,
                onChanged: notifier.onChange,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: notifier.password,
                onChanged: notifier.onChange,
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
                valueListenable: notifier.isValid,
                builder: (context, isValid, child) {
                  return FilledButton(
                    onPressed: (isValid == true ? notifier.login : null),
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
