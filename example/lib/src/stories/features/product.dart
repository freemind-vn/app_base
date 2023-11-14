import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:app/product.dart';

final productStories = [
  Story(
    name: 'Product/ProductCategoryList',
    builder: (context) {
      return ProductCategoryList(controller: ProductCategoryListController());
    },
  ),
  Story(
    name: 'Product/ProductItem',
    builder: (context) {
      return const ProductItem();
    },
  ),
];
