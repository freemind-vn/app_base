import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/core.dart';
import 'package:app/home.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.moduleX(HomeRoute.root, module: HomeModule.new);
    r.moduleX(UserRoute.root, module: UserModule.new);
    r.moduleX(CartRoute.root, module: CartModule.new);

    r.moduleX(StoryRoute.root, module: StoriesModule.new);
    // r.child('/stories', child: (context) => const Stories());
  }
}
