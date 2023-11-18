import 'package:flutter_modular/flutter_modular.dart';

import 'application/home_page.dart';
import 'home_route.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(HomeRoute.root, child: (context) => const HomePage());
  }
}
