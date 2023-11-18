import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';
import 'application/home_page.dart';
import 'home_route.dart';

class HomeModule extends ModuleExt {
  HomeModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(relative(HomeRoute.root), child: (context) => const HomePage());
  }
}
