import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/product.dart';
import 'package:app/stories.dart';
import 'package:app/user.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Modular.get<HomePageController>();
  final userController = Modular.get<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.network(
          'https://trongkhuvuon.com/wp-content/uploads/2022/01/trongkhuvuonsmall.png',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder(
              initialData: userController.user,
              stream: userController.stream,
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    'Hello, ${snapshot.hasData ? snapshot.data!.username : 'world!'}',
                  ),
                );
              }),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed(StoryRoute.root),
            child: const Text(StoryRoute.root),
          ),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed(UserRoute.signin),
            child: const Text(UserRoute.signin),
          ),
          OutlinedButton(
            onPressed: () => Modular.to.pushNamed(CartRoute.root),
            child: const Text(CartRoute.root),
          ),
          HomeSearchField(controller: controller.searchFieldController),
          Carousel(),
          ProductCategoryList(
            controller: controller.productCategoryListController,
          ),
        ],
      ),
    );
  }
}
