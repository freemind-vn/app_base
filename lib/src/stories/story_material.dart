import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class MaterialStory extends StatelessWidget {
  const MaterialStory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(),
        ),
        title: const Text('Story Book'),
      ),
      body: Storybook(
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
      ),
    );
  }
}
