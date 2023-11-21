import 'package:app/base.dart';
import 'package:app/core.dart';
import 'package:app/product.dart';

class ProductCategoryListController extends Controller {
  final repository = ProductCategoryRepository();

  list() async {
    final categories = await repository.list();
    send(ListEvent(items: categories));
  }

  listProduct(int category) async {
    send(ListProductEvent(category, status: EventStatus.processing));
    final products = await repository.listProduct(category);
    send(ListProductEvent(category, items: products));
  }
}
