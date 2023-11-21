import 'package:flutter/material.dart';

import 'package:app/app.dart';
import 'package:app/core.dart';

class AppController extends Controller {
  /// Call this manualy or when the brightness changed.
  setThemeMode(ThemeMode value) {
    send(ThemeDataEvent(value));
  }
}
