import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/core.dart';
import 'package:app/home.dart';

class HomeSearchFieldController extends Controller {
  onSubmit(String value) {
    // Send this event to search result widget
    send(HomeSearchFieldSubmitEvent(value));
  }

  onPressedCart() {
    Modular.to.pushNamed(CartRoute.root);
  }
}
