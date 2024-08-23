import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

import 'package:app/user.dart';

class WellcomePage extends StatelessWidget {
  WellcomePage({super.key})
      : assert(Modular.args.data != null),
        assert(Modular.args.data is User) {
    controller.user = Modular.args.data as User;
  }
  final controller = Modular.get<WellcomeController>();

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
      body: ControllerBuilder(
          initialData: controller.user,
          controller: controller,
          builder: (context, user) {
            if (user == null) {
              return const Center(
                child: Text('something wrong, user is null!!!'),
              );
            }
            return Center(
              child: Text('wellcome ${user.username} to freemind!'),
            );
          }),
    );
  }
}
