import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

import 'package:app/app.dart';

class AppController extends Controller {
  /// Call this manualy or when the brightness changed.
  setThemeMode(ThemeMode value) {
    send(ThemeDataEvent(value));
  }
}
