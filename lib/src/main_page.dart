import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/core.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final controller = Modular.get<BottomNavController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          'https://trongkhuvuon.com/wp-content/uploads/2022/01/trongkhuvuonsmall.png',
        ),
      ),
      bottomNavigationBar: BottomNav(controller: controller),
      body: const RouterOutlet(),
    );
  }
}
