import 'package:woo_api/woo_api.dart' as woo;

class Category {
  Category(this.id, this.name);

  final int id;
  final String name;

  static Category fromRaw(woo.ProductCategory category) => Category(
        category.id!,
        category.name!,
      );
}

class Product {
  Product(this.id, this.name);

  final int id;
  final String name;
  static Product fromRaw(woo.Product product) => Product(
        product.id!,
        product.name!,
      );
}
