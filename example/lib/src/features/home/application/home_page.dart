import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

import 'package:app/cart.dart';
import 'package:app/home.dart';
import 'package:app/product.dart';
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
              child: Image.network('https://picsum.photos/300/200'),
            ),
            ControllerBuilder<User?>(
                initialData: userController.user,
                controller: userController,
                noDataBuilder: (p0) => const SizedBox.shrink(),
                builder: (context, user) {
                  return Center(
                    child: Text(
                      'Hello, ${user?.username ?? 'world!'}',
                    ),
                  );
                }),
            const SizedBox(height: 12),
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
