import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';
import 'package:app/stories.dart';

class StoriesModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    final route = RoutePath(StoryRoute.root);
    r.child(
      route.relative(StoryRoute.root),
      child: (context) => const Stories(),
    );
  }
}
