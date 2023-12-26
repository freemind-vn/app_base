import 'package:app_base/core.dart';

import 'package:app/base.dart';
import 'package:app/product.dart';

class ProductCategoryListController extends Controller {
  final repository = ProductCategoryRepository();

  list() async {
    try {
      final categories = await repository.list();
      send(ListEvent(items: categories));
    } catch (error) {
      send(ListEvent<Category>(
        status: EventStatus.error,
        message: error.toString(),
      ));
    }
  }

  listProduct(int category) async {
    send(ListProductEvent(category, status: EventStatus.processing));
    try {
      final products = await repository.listProduct(category);
      send(ListProductEvent(category, items: products));
    } catch (error) {
      send(ListProductEvent(
        category,
        status: EventStatus.error,
        message: error.toString(),
      ));
    }
  }
}
