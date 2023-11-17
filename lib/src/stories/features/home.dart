import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:app/home.dart';

final homeStories = [
  Story(
    name: 'Home/SearchField',
    builder: (context) {
      return const HomeSearchField();
    },
  ),
];
