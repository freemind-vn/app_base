import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/src/features/home.dart';
import 'package:app/stories.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/stories', child: (context) => const MaterialStory());
  }
}
