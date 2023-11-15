import 'package:flutter_modular/flutter_modular.dart';

import '../user.dart';

class UserModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/signin', child: (context) => const SigninPage());
  }
}
