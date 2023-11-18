import 'package:flutter_modular/flutter_modular.dart';

class ModuleExt extends Module {
  late final String _root;

  ModuleExt(String root) : super() {
    _root = root.endsWith('/') ? root.substring(0, root.length - 1) : root;
  }

  String relative(String route) {
    return _root.isNotEmpty ? route.replaceFirst(_root, '') : route;
  }
}

extension RouteManagerExt on RouteManager {
  moduleX<T extends Module>(
    String name, {
    required T Function(String) module,
    TransitionType? transition,
    CustomTransition? customTransition,
    Duration? duration,
    List<RouteGuard> guards = const [],
  }) {
    this.module(name,
        module: module(name),
        transition: transition,
        customTransition: customTransition,
        duration: duration,
        guards: guards);
  }
}
