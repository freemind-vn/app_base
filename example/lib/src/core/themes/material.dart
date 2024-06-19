import 'package:flutter/material.dart';

import 'color_schemes.g.dart';
import 'custom_style.dart';

// define name for custom style
const themeStyle1 = 'style1';
const themeStyle2 = 'style2';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme(
    centerTitle: true,
    shape: Border(
      bottom: BorderSide(
        color: lightColorScheme.surfaceContainerHighest,
        width: 1,
      ),
    ),
  ),
  extensions: [
    CustomStyle(
      name: themeStyle1,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
      ),
    ),
  ],
);

final dartkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  extensions: [
    CustomStyle(
      name: themeStyle1,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.green),
      ),
    ),
    CustomStyle(
      name: themeStyle2,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.red),
      ),
    )
  ],
);
