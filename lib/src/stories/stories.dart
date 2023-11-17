import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'package:app/core.dart';
import 'package:app/stories.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

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
        wrapperBuilder: (context, child) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: dartkTheme,
            // debugShowMaterialGrid: true,
            debugShowCheckedModeBanner: false,
            home: Scaffold(body: Center(child: child)),
          );
        },
        stories: [
          ...materialStories,
          ...homeStories,
          ...userStories,
        ],
        initialStory: 'Home/SearchField',
      ),
    );
  }
}
