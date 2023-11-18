import 'package:app/core.dart';
import 'package:app/product.dart';

class ProductCategoryListController extends Controller {
  final repository = ProductCategoryRepository();

  list() {
    send(ProductCategoryListEvent(repository.list()));
  }
}
