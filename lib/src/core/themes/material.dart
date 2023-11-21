import 'package:flutter/material.dart';

import 'package:app/core.dart';
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
  extensions: [
    ButtonStyleExt<Abc>(
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
    ),
  ],
);

final dartkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  extensions: [
    ButtonStyleExt<Abc>(
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.green),
      ),
    ),
    ButtonStyleExt(
      ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
    )
  ],
);

// each class for each custom style
abstract class Abc {}
