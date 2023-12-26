import 'package:app_base/core.dart';

import 'package:app/home.dart';
import 'package:app/user.dart';

class HomeModule extends Module {
  HomeModule(super.root);

  @override
  void binds(i) {
    i.addSingleton(HomePageController.new);
    i.addSingleton(UserController.new);
  }

  @override
  void routes(r) {
    r.child(relative(HomeRoute.root), child: (context) => const HomePage());
  }
}
