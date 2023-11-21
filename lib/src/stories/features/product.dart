import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:app/product.dart';

final productStories = [
  Story(
    name: 'Product/ProductItem',
    builder: (context) {
      return const ProductItem();
    },
  ),
];
