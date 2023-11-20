import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/core.dart';
import 'package:app/home.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';
import 'main_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(UserController.new);
    i.addSingleton(BottomNavController.new);
    i.addSingleton(HomePageController.new);
  }

  @override
  void routes(r) {
    r.moduleX(HomeRoute.root, module: HomeModule.new);
    r.moduleX(UserRoute.root, module: UserModule.new);
    r.moduleX(CartRoute.root, module: CartModule.new);

    r.moduleX(StoryRoute.root, module: StoriesModule.new);
    // r.child('/stories', child: (context) => const Stories());
    r.child('/', child: (context) => MainPage(), children: [
      ChildRoute(
        HomeRoute.root,
        child: (context) => HomePage(),
      ),
      ChildRoute(
        CartRoute.root,
        child: (context) => const CartPage(),
      ),
      ChildRoute(
        UserRoute.profile,
        child: (context) => const ProfilePage(),
      )
    ]);
  }
}
