import 'package:flutter/material.dart';

import 'package:app/user.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.controller});

  final SigninFormController controller;

  @override
  Widget build(BuildContext context) {
    final stream = controller.stream.where(
      (event) => event.type == SigninEventType.validate,
    );
    return Column(
      children: [
        TextField(
          onChanged: controller.onPasswordChanged,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Username',
          ),
        ),
        const SizedBox(height: 6),
        StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              return TextField(
                onChanged: controller.onUsernameChanged,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  errorText: snapshot.hasError
                      ? (snapshot.error as SigninEvent).data
                      : null,
                ),
                obscureText: true,
              );
            }),
        const SizedBox(height: 6),
        StreamBuilder(
          stream: stream,
          builder: (context, value) {
            return ElevatedButton(
              onPressed: (!value.hasError) ? controller.onSubmit : null,
              child: const Text('Login'),
            );
          },
        ),
      ],
    );
  }
}
