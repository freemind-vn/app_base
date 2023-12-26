import 'package:app_base/core.dart';

import 'package:app/stories.dart';

class StoriesModule extends Module {
  StoriesModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(relative(StoryRoute.root), child: (context) => const Stories());
  }
}
