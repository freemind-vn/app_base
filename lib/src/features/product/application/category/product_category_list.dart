import 'package:flutter/material.dart';

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
    final stream = controller.on<ProductCategoryListEvent>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              snapshot.data?.items.length ?? 0,
              (index) {
                final item = snapshot.data?.items[index];
                return FilledButton.tonal(
                  onPressed: () {},
                  child: Text(item?.name ?? ''),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
