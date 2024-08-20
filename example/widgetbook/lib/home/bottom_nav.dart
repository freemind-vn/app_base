import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:app/home.dart';
import 'package:app_base/app_base.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: BottomAppBar,
  path: 'home',
)
Widget buildBottomNav(BuildContext context) {
  return Scaffold(
    bottomNavigationBar: BottomNavigation(
      controller: NavigationController<BottomNavDestination>(),
      destinations: destinations,
    ),
  );
}
