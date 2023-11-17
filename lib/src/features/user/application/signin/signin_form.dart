import 'package:flutter/material.dart';

import 'package:app/core.dart';
import 'package:app/user.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key, required this.controller});

  final SigninFormController controller;

  @override
  Widget build(BuildContext context) {
    final stream = controller.on<SigninValidateEvent>();
    return Column(
      children: [
        StreamBuilder(
          stream: stream.byField(SigninFormController.validUsername),
          builder: (context, snapshot) {
            return TextField(
              onChanged: controller.onUsernameChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Username',
                errorText: snapshot.data?.status == EventStatus.error
                    ? snapshot.data?.message
                    : null,
              ),
            );
          },
        ),
        const SizedBox(height: 6),
        StreamBuilder(
          stream: stream.byField(SigninFormController.validPassword),
          builder: (context, snapshot) {
            return TextField(
              onChanged: controller.onPasswordChanged,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Password',
                errorText: snapshot.data?.status == EventStatus.error
                    ? snapshot.data?.message
                    : null,
              ),
              obscureText: true,
            );
          },
        ),
        const SizedBox(height: 6),
        StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed:
                  (snapshot.data?.field == SigninFormController.validAll &&
                          snapshot.data?.status == EventStatus.success)
                      ? controller.onSubmit
                      : null,
              child: const Text('Login'),
            );
          },
        ),
      ],
    );
  }
}
