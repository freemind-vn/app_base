import 'package:app_base/app_base.dart';

class ListEvent<T> extends BaseEvent {
  ListEvent({this.items = const [], super.status, super.message});

  final List<T> items;
}
