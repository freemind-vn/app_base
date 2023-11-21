import 'package:app/base.dart';
import 'package:app/core.dart';
import 'package:app/product.dart';

class ProductCategoryListController extends Controller {
  final repository = ProductCategoryRepository();

  list() async {
    final categories = await repository.list();
    send(ListEvent(categories));
  }

  listProduct(int category) async {
    final products = await repository.listProduct(category);
    send(ListEvent(products));
  }
}
