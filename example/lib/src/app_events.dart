import 'package:flutter/material.dart';

/// Change the theme mode.
@immutable
class ThemeDataEvent {
  const ThemeDataEvent(this.themeMode);

  final ThemeMode themeMode;
}
