import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/home.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(HomeRoute.root, module: HomeModule());
    r.module(UserRoute.root, module: UserModule());

    r.module(StoryRoute.root, module: StoriesModule());
    // r.child('/stories', child: (context) => const Stories());
  }
}
