import 'package:flutter_modular/flutter_modular.dart' as base;

export 'package:flutter_modular/flutter_modular.dart'
    hide RouteManageExt, Module;

class Module extends base.Module {
  late final String? _root;

  Module([String? root]) : super() {
    if (root != null) {
      _root = root.endsWith('/') ? root.substring(0, root.length - 1) : root;
    }
  }

  String relative(String route) {
    if (_root == null) {
      return route;
    }
    return _root.isNotEmpty ? route.replaceFirst(_root, '') : route;
  }
}

extension RouteManagerExt on base.RouteManager {
  module<T extends base.Module>(
    String name, {
    required T Function(String) module,
    base.TransitionType? transition,
    base.CustomTransition? customTransition,
    Duration? duration,
    List<base.RouteGuard> guards = const [],
  }) {
    add(base.ModuleRoute(
      name,
      module: module(name),
      customTransition: customTransition,
      duration: duration,
      transition: transition,
      guards: guards,
    ));
  }

  void child(
    String name, {
    required base.ModularChild child,
    base.CustomTransition? customTransition,
    List<base.ParallelRoute> children = const [],
    Duration? duration,
    base.TransitionType? transition,
    bool maintainState = true,
    List<base.RouteGuard> guards = const [],
  }) {
    add(base.ChildRoute(
      name,
      child: child,
      children: children,
      customTransition: customTransition,
      duration: duration,
      transition: transition,
      maintainState: maintainState,
      guards: guards,
    ));
  }

  void redirect(
    String name, {
    required String to,
  }) {
    add(base.RedirectRoute(name, to: to));
  }

  void wildcard({
    required base.ModularChild child,
    base.TransitionType transition = base.TransitionType.defaultTransition,
    base.CustomTransition? customTransition,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    add(base.WildcardRoute(
      child: child,
      transition: transition,
      customTransition: customTransition,
      duration: duration,
    ));
  }
}
