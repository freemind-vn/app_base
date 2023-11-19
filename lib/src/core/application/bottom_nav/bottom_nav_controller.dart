import 'package:app/core.dart';

class BottomNavController extends Controller<int> {
  int index = 0;

  onDestinationSelected(int value) {
    index = value;
    send(index);
  }
}
