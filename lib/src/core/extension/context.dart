import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);

  // Usage example: `context.messenger`
  ScaffoldMessengerState get messenger => ScaffoldMessenger.of(this);

  // Usage example: `context.media`
  MediaQueryData get media => MediaQuery.of(this);
}
