import 'package:flutter/material.dart';

import 'package:storybook_flutter/storybook_flutter.dart';

class MaterialStory extends StatelessWidget {
  const MaterialStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Storybook(
      stories: [
        Story(
          name: 'Buttons/OutlinedButton',
          builder: (context) {
            return OutlinedButton(
              child: const Text('OutlinedButton'),
              onPressed: () {},
            );
          },
        )
      ],
    );
  }
}
