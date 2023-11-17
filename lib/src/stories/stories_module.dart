import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/stories.dart';

class StoriesModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const Stories());
  }
}
