import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/core.dart';

class CartModule extends ModuleExt {
  CartModule(super.root);

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => const CartPage());
  }
}
