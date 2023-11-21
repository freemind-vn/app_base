import 'package:app/core.dart';

class ListEvent<T> extends BaseEvent {
  ListEvent(this.items, {super.status, super.message});

  List<T> items = [];
}
