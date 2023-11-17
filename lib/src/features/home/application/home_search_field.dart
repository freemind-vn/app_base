import 'package:flutter/material.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
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
                fillColor: Theme.of(context).colorScheme.background,
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}
