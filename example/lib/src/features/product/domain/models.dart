import 'package:intl/intl.dart';
import 'package:woo_api/woo_api.dart' as woo;

class Category {
  Category(this.id, this.name);

  final int id;
  final String name;

  static Category fromRaw(woo.ProductCategory category) {
    return Category(
      category.id ?? 0,
      category.name ?? '',
    );
  }
}

class Product {
  Product({
    required this.id,
    required this.name,
    this.categories = const [],
    this.slug,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.description,
    this.shortDescription,
  });

  final int id;
  final String name;
  final List<String> categories;

  final String? slug;
  final double? price;
  final double? regularPrice;
  final double? salePrice;
  final String? description;
  final String? shortDescription;

  static Product fromRaw(woo.Product product) {
    return Product(
      id: product.id ?? 0,
      name: product.name ?? '',
    );
  }

  static final _currency = NumberFormat.currency(locale: 'vi_VN');

  String formatRegularPrice() {
    return _currency.format(regularPrice);
  }

  String formatSalePrice() {
    return _currency.format(salePrice);
  }
}
