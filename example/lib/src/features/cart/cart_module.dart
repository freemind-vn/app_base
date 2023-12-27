import 'package:app_base/app_base.dart';

import 'package:app/cart.dart';

class CartModule extends Module {
  CartModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const CartPage());
  }
}
