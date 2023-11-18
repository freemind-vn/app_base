import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/stories.dart';
import 'package:app/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sample App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Hello, world!')),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed(StoryRoute.root),
            child: const Text(StoryRoute.root),
          ),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed(UserRoute.signin),
            child: const Text(UserRoute.signin),
          ),
        ],
      ),
    );
  }
}
