import 'package:flutter/material.dart';

import 'package:app_base/core.dart';

import 'package:app/home.dart';

/// The main page layout which has a navigation bar
/// to navigate to other main pages.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        Modular.get<NavigationController<BottomNavDestination>>();
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        controller: controller,
        destinations: destinations,
      ),
      body: StreamBuilder(
        initialData: 0,
        stream: controller.stream,
        builder: (context, snapshot) {
          return IndexedStack(
            index: snapshot.data ?? 0,
            children: controller.getListWidget(),
          );
        },
      ),
      // Enable below for nested navigation
      // Warning: child route will be rebuiled on changed
      // body: const RouterOutlet(),
    );
  }
}
