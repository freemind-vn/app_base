import 'package:flutter/widgets.dart';

class Carousel extends StatelessWidget {
  Carousel({super.key});

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            controller: controller,
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Image.network('https://picsum.photos/300/200');
            },
          ),
        ),
      ],
    );
  }
}
