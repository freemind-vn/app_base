import 'package:flutter/material.dart';

import 'navigation_controller.dart';

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
    return StreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) {
        return NavigationBar(
          onDestinationSelected: controller.onSelected,
          selectedIndex: snapshot.data ?? 0,
          destinations: controller.items,
        );
      },
    );
  }
}
