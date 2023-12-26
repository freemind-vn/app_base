import 'package:app_base/core.dart';

import 'package:app/app.dart';
import 'package:app/home.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(AppController.new);
    i.addSingleton(UserController.new);
    i.addSingleton(NavigationController<BottomNavDestination>.new);
    i.addSingleton(HomePageController.new);
  }

  @override
  void routes(r) {
    r.module(HomeRoute.root, module: HomeModule.new);
    r.module(UserRoute.root, module: UserModule.new);
    // r.module(CartRoute.root, module: CartModule.new);

    r.module(StoryRoute.root, module: StoriesModule.new);

    r.child('/', child: (context) => const MainPage());

    // The below used for nested routes
    // r.child('/stories', child: (context) => const Stories());
    // r.child('/', child: (context) => MainPage(), children: [
    //   ChildRoute(
    //     HomeRoute.root,
    //     child: (context) => HomePage(),
    //   ),
    //   ChildRoute(
    //     CartRoute.root,
    //     child: (context) => const CartPage(),
    //   ),
    //   ChildRoute(
    //     UserRoute.profile,
    //     child: (context) => const ProfilePage(),
    //   )
    // ]);
  }
}
