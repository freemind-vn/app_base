import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Column(
        children: [
          Image.network(
            'https://trongkhuvuon.com/wp-content/uploads/2022/07/gaba_acide_gamma-aminobutyrique.png',
          ),
          Text(
            'Hộp viên uống GABA',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '490,000đ',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                '490,000đ',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.apply(decoration: TextDecoration.lineThrough),
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
