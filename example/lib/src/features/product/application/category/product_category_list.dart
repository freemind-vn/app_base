import 'package:app/base.dart';
import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

import 'package:app/product.dart';

class ProductCategoryList extends StatelessWidget {
  ProductCategoryList({super.key, required this.controller}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.list();
    });
  }

  final ProductCategoryListController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ControllerBuilder<ListEvent<Category>>(
        controller: controller,
        builder: (context, event) {
          if (event?.data == null) {
            return const SizedBox();
          }
          final items = event!.data!;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  items.length,
                  (index) => buildCategory(
                    items[index],
                  ),
                ),
              ),
              ControllerBuilder<ListProductEvent>(
                controller: controller,
                builder: (context, event) {
                  if (event?.data == null) {
                    return const SizedBox();
                  }
                  final items = event!.data!;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      items.length,
                      (index) => buildProduct(items[index]),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }

  buildCategory(Category item) {
    return FilledButton.tonal(
      onPressed: () => controller.listProduct(item.id),
      child: Row(
        children: [
          Text(item.name),
          ControllerBuilder<ListProductEvent>(
            controller: controller,
            filter: (stream) => stream.byCategory(item.id),
            builder: (context, event) {
              if (event?.status == EventStatus.processing) {
                return const CircularProgressIndicator();
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  buildProduct(Product item) {
    return FilledButton.tonal(
      onPressed: null,
      child: Text(item.name),
    );
  }
}
