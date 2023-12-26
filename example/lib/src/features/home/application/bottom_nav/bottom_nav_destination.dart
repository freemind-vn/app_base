import 'package:flutter/material.dart';

import 'package:app_base/core.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/user.dart';

class BottomNavDestination extends NavigationDestination {
  const BottomNavDestination(
    this.destination, {
    super.key,
    required super.icon,
    super.selectedIcon,
    required super.label,
    super.tooltip,
  });
  final Widget destination;
}

extension BottomNavControllerBottomNavDestinationExt
    on NavigationController<BottomNavDestination> {
  getListWidget() {
    return items.map((e) => e.destination).toList();
  }
}

const destinations = [
  BottomNavDestination(
    HomePage(),
    selectedIcon: Icon(Icons.home),
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavDestination(
    Text('News'),
    icon: Icon(Icons.newspaper),
    label: 'News',
  ),
  BottomNavDestination(
    Text('Notifications'),
    icon: Badge(child: Icon(Icons.notifications_sharp)),
    label: 'Notifications',
  ),
  BottomNavDestination(
    CartPage(),
    icon: Icon(Icons.shopping_bag),
    label: 'Cart',
  ),
  BottomNavDestination(
    ProfilePage(),
    icon: Icon(Icons.account_circle),
    label: 'Profile',
  ),
];
