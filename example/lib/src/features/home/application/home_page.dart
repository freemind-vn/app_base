import 'package:flutter/material.dart';

import 'package:app_base/core.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/product.dart';
import 'package:app/stories.dart';
import 'package:app/theme.dart';
import 'package:app/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<HomePageController>();
    final userController = Modular.get<UserController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                'https://trongkhuvuon.com/wp-content/uploads/2022/01/trongkhuvuonsmall.png',
              ),
            ),
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
              style: context.theme.custom(themeStyle1),
              child: const Text(
                StoryRoute.root,
              ),
            ),
            OutlinedButton(
              onPressed: () => Modular.to.pushNamed(UserRoute.signin),
              style: context.theme.custom(themeStyle2),
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
      ),
    );
  }
}
