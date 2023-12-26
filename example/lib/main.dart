import 'package:flutter/material.dart';

import 'package:app_base/core.dart';

import 'package:app/src/app_module.dart';
import 'src/app.dart';

void main() {
  runApp(ModularApp(
    module: AppModule(),
    child: const App(),
  ));
}
