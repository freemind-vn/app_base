import 'package:flutter/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:app/product.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: ProductItem,
  path: 'product',
)
Widget buildProductItem(BuildContext context) {
  return const ProductItem();
}
