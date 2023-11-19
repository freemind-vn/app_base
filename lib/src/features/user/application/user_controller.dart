import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';
import 'package:app/user.dart';

class UserController extends Controller<User> {
  User? user;

  // sample for listen event of local Controller in another module
  // 1. bind module
  // 2. add listen to the Controller that you want to get event
  // only use for singleton or instance bind
  // for normal bind, new instance of Controller will be create when call get
  // so you can listen here
  startSignin() {
    Modular.bindModule(UserModule(UserRoute.root));
    Modular.get<SignInController>().stream.listen((event) {
      if (event.status == EventStatus.success) {
        user = event.user;
        send(user!);
      }
    });

    Modular.to.pushNamed(UserRoute.signin);
  }
}
