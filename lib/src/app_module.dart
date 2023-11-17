import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/home.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: HomeModule());
    r.module('/', module: UserModule());
    r.child('/stories', child: (context) => const MaterialStory());
  }
}
