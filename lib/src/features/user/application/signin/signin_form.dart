import 'package:flutter/material.dart';

import 'package:app/core.dart';

enum SigninFormField { username, password, agree }

class SignInForm extends StatelessWidget {
  SignInForm({super.key, FormController? controller, this.onSubmit}) {
    this.controller = controller ?? FormController(SigninFormField.values);
  }

  late final FormController controller;
  final Function(String username, String password)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final stream = controller.on<FormValidateEvent>();
    return Form(
      child: Column(
        children: [
          StreamBuilder(
            stream: stream.byField(SigninFormField.username),
            builder: (context, snapshot) {
              final input = controller.register<String>(
                SigninFormField.username,
                FormInput(validator: (value) {
                  if (value.isEmpty) {
                    return 'required';
                  }
                  return null;
                }),
              );
              return TextFormField(
                onChanged: input.onChanged,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Username',
                  errorText: snapshot.data?.message,
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: stream.byField(SigninFormField.password),
            builder: (context, snapshot) {
              final input = controller.register<String>(
                SigninFormField.password,
                FormInput(validator: (value) {
                  if (value.isEmpty) {
                    return 'required';
                  }
                  return null;
                }),
              );
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  errorText: snapshot.data?.message,
                ),
                onChanged: input.onChanged,
                obscureText: true,
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: stream.byField(SigninFormField.agree),
            builder: (context, snapshot) {
              final input = controller.register<bool?>(
                SigninFormField.agree,
                FormInput(validator: (value) {
                  if (value != true) {
                    return '';
                  }
                  return null;
                }),
              );
              return Checkbox(
                value: input.value,
                tristate: true,
                onChanged: input.onChanged,
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: controller.isValid(null) ? _onSubmit : null,
                child: const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }

  _onSubmit() {
    if (controller.isValid(null)) {
      onSubmit?.call(
        controller.getInput(SigninFormField.username)?.value,
        controller.getInput(SigninFormField.password)?.value,
      );
    }
  }
}
