import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/core.dart';
import 'package:app/home.dart';

class BottomNavController extends Controller<int> {
  int index = 0;

  onDestinationSelected(int value) {
    index = value;
    send(index);
    if (index == 0) {
      Modular.to.pushReplacementNamed(HomeRoute.root);
    } else {
      Modular.to.pushReplacementNamed(CartRoute.root);
    }
  }
}
