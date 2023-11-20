import 'package:flutter/material.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/user.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key, required this.controller});

  final BottomNavController controller;
  final destinations = <Widget>[
    const NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ).register(const HomePage()),
    const NavigationDestination(
      icon: Icon(Icons.newspaper),
      label: 'News',
    ).register(const Text('News')),
    const NavigationDestination(
      icon: Badge(child: Icon(Icons.notifications_sharp)),
      label: 'Notifications',
    ).register(const Text('Notifications')),
    const NavigationDestination(
      icon: Icon(Icons.shopping_bag),
      label: 'Cart',
    ).register(const CartPage()),
    const NavigationDestination(
      icon: Icon(Icons.account_circle),
      label: 'Profile',
    ).register(const ProfilePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.stream,
      builder: (context, snapshot) {
        return NavigationBar(
          onDestinationSelected: controller.onDestinationSelected,
          selectedIndex: snapshot.data ?? 0,
          destinations: destinations,
        );
      },
    );
  }
}
