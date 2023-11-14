import 'package:app_base/app_base.dart';

import 'package:app/cart.dart';
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
