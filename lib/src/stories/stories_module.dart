import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';
import 'package:app/stories.dart';

class StoriesModule extends ModuleExt {
  StoriesModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(relative(StoryRoute.root), child: (context) => const Stories());
  }
}
