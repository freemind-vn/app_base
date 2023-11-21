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
  Product({
    this.id,
    this.name,
    this.categories = const [],
    this.slug,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.description,
    this.shortDescription,
  });

  final int? id;
  final String? name;
  final List<String> categories;

  final String? slug;
  final double? price;
  final double? regularPrice;
  final double? salePrice;
  final String? description;
  final String? shortDescription;

  static Product fromRaw(woo.Product product) => Product(
        id: product.id,
        name: product.name!,
      );
}
