import 'package:app_base/core.dart';

import 'package:app/user.dart';

class UserModule extends ModuleExt {
  UserModule(super.root);

  @override
  void binds(i) {
    i.add(SignInController.new);
    i.add(WellcomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      relative(UserRoute.signin),
      child: (context) => SignInPage(),
    );
    r.child(
      relative(UserRoute.wellcome),
      child: (context) => WellcomePage(),
    );
  }
}
