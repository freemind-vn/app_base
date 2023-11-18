import 'package:app/product.dart';

class ProductCategoryListEvent {
  ProductCategoryListEvent(this.items, {this.status, this.message});

  final int? status;
  final String? message;
  List<Category> items = [];
}

class ProductCategoryListClickEvent {
  ProductCategoryListClickEvent(this.item);
  Category item;
}
