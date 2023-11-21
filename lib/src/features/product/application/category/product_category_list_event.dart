import 'package:app/base.dart';
import 'package:app/product.dart';

class ListProductEvent extends ListEvent<Product> {
  ListProductEvent(this.category, {super.items, super.status, super.message});
  int category;
}

extension ListProductEventStreamExtension on Stream<ListProductEvent> {
  Stream<ListProductEvent> byCategory(int category) {
    return where((event) => event.category == category);
  }
}
