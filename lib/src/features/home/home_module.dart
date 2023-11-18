import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';
import 'package:app/home.dart';

class HomeModule extends ModuleExt {
  HomeModule(super.root);

  @override
  void binds(i) {
    i.add(HomePageController.new);
  }

  @override
  void routes(r) {
    r.child(relative(HomeRoute.root), child: (context) => HomePage());
  }
}
