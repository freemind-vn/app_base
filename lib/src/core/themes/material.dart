import 'package:flutter/material.dart';

import 'color_schemes.g.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    shape: Border(
      bottom: BorderSide(
        color: lightColorScheme.surfaceVariant,
        width: 1,
      ),
    ),
  ),
);

final dartkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
);
