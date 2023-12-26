import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:app/app.dart';
import 'package:app/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(HomeRoute.root);

    final controller = Modular.get<AppController>();
    final stream = controller.on<ThemeDataEvent>();
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return MaterialApp.router(
          theme: lightTheme,
          darkTheme: dartkTheme,
          themeMode: snapshot.data?.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'Example App',
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: MaxWidthBox(
                maxWidth: 1280,
                background: Container(
                  color: context.theme.colorScheme.background,
                ),
                child: child!,
              ),
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
          },
          routerConfig: Modular.routerConfig,
        );
      },
    );
  }
}
