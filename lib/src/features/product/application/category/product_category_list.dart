import 'package:flutter/material.dart';

import 'package:app/base.dart';
import 'package:app/core.dart';
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
      child: StreamBuilder(
        stream: controller.on<ListEvent<Category>>(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  snapshot.data!.items.length,
                  (index) => buildCategory(
                    snapshot.data!.items[index],
                  ),
                ),
              ),
              StreamBuilder(
                stream: controller.on<ListEvent<Product>>(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      snapshot.data!.items.length,
                      (index) => buildProduct(snapshot.data!.items[index]),
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
    final stream = controller.on<ListProductEvent>().byCategory(item.id);
    return FilledButton.tonal(
      onPressed: () => controller.listProduct(item.id),
      child: Row(
        children: [
          Text(item.name),
          StreamBuilder(
            stream: stream,
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data?.status == EventStatus.processing) {
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
      child: Text(item.name ?? ''),
    );
  }
}
