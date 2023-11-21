import 'package:app/base.dart';
import 'package:app/product.dart';

class ProductCategoryRepository {
  Future<List<Category>> list() async {
    final res = await woo.getProductCategories();
    return res.map((e) => Category(e.id!, e.name!)).toList();
  }

  Future<List<Product>> listProduct(int category) async {
    final res = await woo.getAllProducts(category: category.toString());
    return res.map((e) => Product(e.id!, e.name!)).toList();
  }
}
