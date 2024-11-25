import 'package:flutter/widgets.dart';

import 'package:app/home.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: HomeSearchField,
  path: 'home',
)
Widget buildSearchField(BuildContext context) {
  return HomeSearchField(controller: HomeSearchFieldController());
}
