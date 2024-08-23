import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'package:app/app.dart';
import 'package:app/home.dart';
import 'package:app/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(HomeRoute.root);

    final controller = Modular.get<AppController>();
    return ControllerBuilder<ThemeDataEvent>(
      controller: controller,
      builder: (context, data) {
        return MaterialApp.router(
          theme: lightTheme,
          darkTheme: dartkTheme,
          themeMode: data?.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'Example App',
          builder: (context, child) {
            return ResponsiveBreakpoints.builder(
              child: MaxWidthBox(
                maxWidth: 1280,
                background: Container(
                  color: context.theme.colorScheme.surface,
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
