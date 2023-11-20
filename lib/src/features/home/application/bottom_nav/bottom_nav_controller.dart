import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';

extension NavigationDestinationExtension on NavigationDestination {
  register(Widget destination) {
    final controller = Modular.get<BottomNavController>();
    controller.registerDestination(destination);
    return this;
  }
}

class BottomNavController extends Controller<int> {
  int index = 0;
  final List<Widget> routes = [];

  registerDestination(Widget item) {
    routes.add(item);
  }

  onDestinationSelected(int value) {
    index = value;
    send(index);

    // if (index == 0) {
    //   Modular.to.pushReplacementNamed(HomeRoute.root);
    // } else {
    //   Modular.to.pushReplacementNamed(CartRoute.root);
    // }
  }
}
