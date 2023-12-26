import 'package:app_base/core.dart';

import 'package:app/cart.dart';

class CartModule extends ModuleExt {
  CartModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const CartPage());
  }
}
