import 'package:flutter/widgets.dart';

import 'controller.dart';

class ControllerBuilder<X> extends StatelessWidget {
  final Widget Function(BuildContext, X?) builder;
  final X? initialData;
  final Controller controller;
  final Stream Function(Stream<X>)? filter;

  const ControllerBuilder({
    super.key,
    required this.builder,
    required this.controller,
    this.initialData,
    this.filter,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: filter?.call(controller.on<X>()) ?? controller.on<X>(),
      initialData: initialData,
      builder: (context, snapshot) {
        return builder(context, snapshot.data);
      },
    );
  }
}
