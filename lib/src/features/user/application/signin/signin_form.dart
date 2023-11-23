import 'package:flutter/material.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:app/core.dart';

enum SigninFormField { username, phone, password, agree }

class SignInForm extends StatelessWidget {
  SignInForm({super.key, FormController? controller, this.onSubmit}) {
    this.controller = controller ?? FormController(SigninFormField.values);
  }

  late final FormController controller;
  final Function(String username, String password)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final stream = controller.on<FormFieldEvent>();
    return Form(
      child: Column(
        children: [
          StreamBuilder(
            stream: controller.register(
              SigninFormField.username,
              FormFieldController<String>(validator: (value) {
                if (value.isEmpty) {
                  return 'required';
                }
                return null;
              }),
            ),
            builder: (context, snapshot) {
              return TextFormField(
                onChanged: snapshot.data?.field?.onChanged,
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
            stream: controller.register(
              SigninFormField.phone,
              FormFieldController<String>(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                inputFormatters: [
                  MaskTextInputFormatter(mask: '+# (###) ###-##-##'),
                ],
              ),
            ),
            builder: (context, snapshot) {
              return TextFormField(
                onChanged: snapshot.data?.field?.onChanged,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Phone',
                  errorText: snapshot.data?.message,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: snapshot.data?.field?.inputFormatters,
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: controller.register(
              SigninFormField.password,
              FormFieldController<String>(validator: (value) {
                if (value.isEmpty) {
                  return 'required';
                }
                return null;
              }),
            ),
            builder: (context, snapshot) {
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  errorText: snapshot.data?.message,
                ),
                onChanged: snapshot.data?.field?.onChanged,
                obscureText: true,
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: controller.register(
              SigninFormField.agree,
              FormFieldController<bool?>(validator: (value) {
                if (value != true) {
                  return '';
                }
                return null;
              }),
            ),
            builder: (context, snapshot) {
              return Checkbox(
                value: snapshot.data?.field?.value,
                tristate: true,
                onChanged: snapshot.data?.field?.onChanged,
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
        controller.getInput(SigninFormField.username)!.value,
        controller.getInput(SigninFormField.password)!.value,
      );
      print(controller.getInput(SigninFormField.phone)!.value);
      print(controller.getInput(SigninFormField.phone)!.rawValue);
    }
  }
}

extension FormInputExt on FormFieldController {
  get rawValue {
    final formatter = inputFormatters
            ?.firstWhere((element) => element is MaskTextInputFormatter)
        as MaskTextInputFormatter?;
    return formatter?.getUnmaskedText() ?? value;
  }
}
