import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum SigninFormInput { username, phone, password, agree }

class SignInForm extends StatelessWidget {
  SignInForm({super.key, FormController? controller, this.onSubmit}) {
    this.controller = controller ?? FormController(SigninFormInput.values);
  }

  late final FormController controller;
  final Function(String username, String password)? onSubmit;

  @override
  Widget build(BuildContext context) {
    final stream = controller.on<FormInputEvent>();
    return Form(
      child: Column(
        children: [
          FormInputBuilder<String>(
            controller: controller.register(
              SigninFormInput.username,
              FormInputController(validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'required';
                }
                return null;
              }),
            ),
            initialData: 'xxx',
            builder: (context, snapshot) {
              return TextFormField(
                onChanged: snapshot.data?.input?.onChanged,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Username',
                  errorText: snapshot.data?.message,
                ),
                initialValue: snapshot.data?.input?.value,
              );
            },
          ),
          const SizedBox(height: 6),
          FormInputBuilder<String>(
            controller: controller.register(
              SigninFormInput.phone,
              FormInputController(
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                onChanged: snapshot.data?.input?.onChanged,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Phone',
                  errorText: snapshot.data?.message,
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: snapshot.data?.input?.inputFormatters,
              );
            },
          ),
          const SizedBox(height: 6),
          FormInputBuilder<String>(
            controller: controller.register(
              SigninFormInput.password,
              FormInputController(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                validateOnChanged: false,
              ),
            ),
            builder: (context, snapshot) {
              return TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Password',
                  errorText: snapshot.data?.message,
                ),
                onChanged: snapshot.data?.input?.onChanged,
                obscureText: true,
              );
            },
          ),
          const SizedBox(height: 6),
          FormInputBuilder<bool?>(
            controller: controller.register(
              SigninFormInput.agree,
              FormInputController(validator: (value) {
                if (value != true) {
                  return '';
                }
                return null;
              }),
            ),
            builder: (context, snapshot) {
              return Checkbox(
                value: snapshot.data?.input?.value,
                tristate: true,
                onChanged: snapshot.data?.input?.onChanged,
              );
            },
          ),
          const SizedBox(height: 6),
          StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: controller.isValid(SigninFormInput.agree)
                    ? _onSubmit
                    : null,
                child: const Text('Login'),
              );
            },
          ),
        ],
      ),
    );
  }

  _onSubmit() {
    if (controller.validate()) {
      onSubmit?.call(
        controller.getInput(SigninFormInput.username)!.value,
        controller.getInput(SigninFormInput.password)!.value,
      );
      log(controller.getInput(SigninFormInput.phone)!.value);
      log(controller.getInput(SigninFormInput.phone)!.rawValue);
    }
  }
}

extension FormInputExt on FormInputController {
  get rawValue {
    final formatter = inputFormatters
            ?.firstWhere((element) => element is MaskTextInputFormatter)
        as MaskTextInputFormatter?;
    return formatter?.getUnmaskedText() ?? value;
  }
}
