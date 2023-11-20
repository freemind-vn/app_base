import 'package:flutter/material.dart';

import 'package:app/home.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.controller});

  final BottomNavController controller;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) {
        return NavigationBar(
          onDestinationSelected: controller.onDestinationSelected,
          selectedIndex: snapshot.data ?? 0,
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
