import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/home.dart';

/// The main page layout which has a navigation bar
/// to navigate to other main pages.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<BottomNavController>();
    return Scaffold(
      bottomNavigationBar: BottomNav(controller: controller),
      body: StreamBuilder(
        initialData: 0,
        stream: controller.stream,
        builder: (context, snapshot) {
          return IndexedStack(
            index: snapshot.data ?? 0,
            children: controller.routes,
          );
        },
      ),
      // Enable below for nested navigation
      // Warning: child route will be rebuiled on changed
      // body: const RouterOutlet(),
    );
  }
}
