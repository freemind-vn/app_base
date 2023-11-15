import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

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
            onPressed: () => Modular.to.pushNamed('/stories'),
            child: const Text('/stories'),
          ),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed('/signin'),
            child: const Text('/signin'),
          ),
        ],
      ),
    );
  }
}
