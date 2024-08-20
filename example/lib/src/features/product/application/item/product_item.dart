import 'package:flutter/material.dart';

import 'package:app_base/app_base.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.dividerColor),
      ),
      child: Column(
        children: [
          Image.network('https://picsum.photos/200'),
          Text(
            'Hộp viên uống GABA',
            style: context.theme.textTheme.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '490,000đ',
                style: context.theme.textTheme.headlineMedium,
              ),
              Text(
                '490,000đ',
                style: context.theme.textTheme.titleMedium?.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
            ),
          )
        ],
      ),
    );
  }
}
