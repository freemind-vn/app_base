import 'package:app_base/app_base.dart';

class ListEvent<T> extends Event<List<T>> {
  ListEvent({super.data = const [], super.status, super.message});
}
