class RoutePath {
  late final String _root;
  RoutePath(String root) {
    _root = root.endsWith('/') ? root.substring(0, root.length - 1) : root;
  }
  String relative(String route) {
    return _root.isNotEmpty ? route.replaceFirst(_root, '') : route;
  }
}
