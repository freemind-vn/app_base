import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:app/core.dart';
import 'package:app/user.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final controller = Modular.get<SignInController>();

  @override
  Widget build(BuildContext context) {
    _eventHandle(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: Modular.to.pop,
        ),
        title: const Text('Signin'),
      ),
      body: Center(
        child: MaxWidthBox(
          maxWidth: 480,
          child: SignInForm(controller: controller.formController),
        ),
      ),
    );
  }

  _eventHandle(BuildContext context) {
    controller.listen(
      (event) {
        switch (event.status) {
          case EventStatus.success:
            showDialog(
              context: context,
              builder: (_) => _buildSuccessDialog(event),
            );
            break;
          case EventStatus.error:
            ScaffoldMessenger.of(context).showSnackBar(
              _buildErrorSnackBar(event.message, context),
            );
            break;
          default:
            break;
        }
      },
      onError: (message) {
        ScaffoldMessenger.of(context).showSnackBar(
          _buildErrorSnackBar(message, context),
        );
      },
    );
  }

  _buildErrorSnackBar(message, context) {
    return SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        right: 20,
        left: 20,
      ),
    );
  }

  _buildSuccessDialog(AuthorizeEvent event) {
    return Material(
      child: SimpleDialogOption(
        onPressed: () {
          Modular.to.popUntil(ModalRoute.withName(UserRoute.signin));
          Modular.to.popAndPushNamed(
            UserRoute.wellcome,
            arguments: event.user,
          );
        },
        child: Center(child: Text(event.message!)),
      ),
    );
  }
}
