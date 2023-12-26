import 'package:flutter/material.dart';

import 'package:storybook_flutter/storybook_flutter.dart';

final buttonStories = [
  Story(
    name: 'Material/Button',
    builder: (context) {
      return Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Icon'),
              ),
              const ElevatedButton(onPressed: null, child: Text('Elevated')),
            ],
          ),
          Row(
            children: [
              OutlinedButton(onPressed: () {}, child: const Text('Outline')),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Outline'),
              ),
              const OutlinedButton(onPressed: null, child: Text('Outline')),
            ],
          ),
        ],
      );
    },
  ),
];
