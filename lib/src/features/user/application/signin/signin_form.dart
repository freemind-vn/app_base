import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key, required this.onSubmit});

  final Function(String username, String password) onSubmit;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _isValid = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _usernameController,
          onChanged: _onChange,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Username',
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _passwordController,
          onChanged: _onChange,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Password',
          ),
          obscureText: true,
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: _isValid,
          builder: (context, value, child) {
            return FilledButton(
              onPressed: value ? _onSubmit : null,
              child: const Text('Login'),
            );
          },
        ),
      ],
    );
  }

  _onChange(String? value) {
    final username = _usernameController.text;
    final password = _passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      _isValid.value = false;
      return;
    }

    _isValid.value = true;
  }

  _onSubmit() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    onSubmit(username, password);
  }
}
