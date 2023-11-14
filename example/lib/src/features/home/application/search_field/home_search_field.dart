import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

import 'package:app/home.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key, required this.controller});

  final HomeSearchFieldController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.primaryColorDark,
      padding: const EdgeInsets.only(left: 16, right: 4, top: 16, bottom: 16),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                filled: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.mic),
                fillColor: context.theme.colorScheme.background,
              ),
              textInputAction: TextInputAction.go,
              onSubmitted: controller.onSubmit,
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: controller.onPressedCart,
            icon: Icon(
              Icons.shopping_bag,
              color: context.theme.colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}
