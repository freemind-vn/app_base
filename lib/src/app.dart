import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/stories');
    return MaterialApp.router(
      title: 'Example App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      // initialRoute: '/stories',
      // home: const HomePage(),
      routerConfig: Modular.routerConfig,
    );
  }
}
