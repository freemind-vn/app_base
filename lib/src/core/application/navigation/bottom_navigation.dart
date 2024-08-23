import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

class BottomNavigation<T extends Widget> extends StatelessWidget {
  BottomNavigation({
    super.key,
    required this.controller,
    required List<T> destinations,
  }) {
    controller.items = destinations;
  }

  final NavigationController<T> controller;

  @override
  Widget build(BuildContext context) {
    return ControllerBuilder<int>(
      controller: controller,
      builder: (context, index) {
        return NavigationBar(
          onDestinationSelected: controller.onSelected,
          selectedIndex: index ?? 0,
          destinations: controller.items,
        );
      },
    );
  }
}
