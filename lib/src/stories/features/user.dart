import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:app/user.dart';

final userStories = [
  Story(
    name: 'User/LoginForm',
    builder: (context) {
      return SignInForm(controller: SigninFormController());
    },
  ),
];
