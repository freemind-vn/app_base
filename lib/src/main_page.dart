import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/user.dart';

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
        stream: controller.stream,
        builder: (context, snapshot) {
          return IndexedStack(
            index: snapshot.data ?? 0,
            children: const [
              HomePage(),
              Text('News'),
              Text('Notifications'),
              CartPage(),
              ProfilePage(),
            ],
          );
        },
      ),
      // Enable below for nested navigation
      // Warning: child route will be rebuiled on changed
      // body: const RouterOutlet(),
    );
  }
}
