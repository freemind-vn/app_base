import 'package:flutter/widgets.dart';

import 'package:app/product.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: ProductItem,
  path: 'product',
)
Widget buildProductItem(BuildContext context) {
  return const ProductItem();
}
