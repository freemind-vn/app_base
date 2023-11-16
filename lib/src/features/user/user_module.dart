import 'package:flutter_modular/flutter_modular.dart';

import '../user.dart';
import 'signin/signin_controller.dart';

class UserModule extends Module {
  @override
  void binds(i) {
    i.add(SignInController.new);
  }

  @override
  void routes(r) {
    r.child('/signin', child: (context) => const SigninPage());
  }
}
