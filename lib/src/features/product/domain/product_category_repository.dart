import 'package:app/base.dart';
import 'package:app/product.dart';

class ProductCategoryRepository {
  Future<List<Category>> list() async {
    return woo
        .getProductCategories()
        .then(
          (value) => Future.value(
            value.map((e) => Category(e.id!, e.name!)).toList(),
          ),
        )
        .onError(
      (error, stackTrace) {
        print(error);
        return [];
      },
    );
  }

  Future<List<Product>> listProduct(int category) {
    return woo
        .getAllProducts(category: category.toString())
        .then(
          (value) => Future.value(
            value.map((e) => Product(e.id!, e.name!)).toList(),
          ),
        )
        .onError(
      (error, stackTrace) {
        print(error);
        return [];
      },
    );
  }
}
