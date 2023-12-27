import 'package:app_base/app_base.dart';

class NavigationController<T> extends Controller<int> {
  int index = 0;
  List<T> items = [];

  getSelectedItem() {
    return items[index];
  }

  getItem(int index) {
    return items[index];
  }

  onSelected(int value) {
    index = value;
    send(index);
  }
}
