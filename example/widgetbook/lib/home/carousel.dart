import 'package:flutter/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'package:app/home.dart';

@widgetbook.UseCase(
  name: 'Default',
  type: Carousel,
  path: 'home',
)
Widget buildCarousel(BuildContext context) {
  return Carousel();
}
