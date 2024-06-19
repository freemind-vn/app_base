import 'package:flutter/material.dart';

extension CustomStyleThemeExtension on ThemeData {
  T? custom<T>(String name) {
    return (extensions[name] as CustomStyle?)?.style;
  }
}

class CustomStyle<T> extends ThemeExtension<CustomStyle<T>> {
  final T style;
  final String? name;
  CustomStyle({this.name, required this.style})
      : assert(
          _lerp(style) != null,
        );

  static dynamic _lerp(dynamic object) {
    switch (object.runtimeType) {
      case ButtonStyle _:
        return ButtonStyle.lerp;
      case TextStyle _:
        return TextStyle.lerp;
    }
    return null;
  }

  @override
  Object get type => name ?? T;

  @override
  CustomStyle<T> copyWith({String? name, T? style}) {
    return CustomStyle(
      name: name ?? this.name,
      style: (this.style as dynamic).merge(style) as T,
    );
  }

  @override
  CustomStyle<T> lerp(covariant CustomStyle<T>? other, double t) {
    return CustomStyle(
      style: (_lerp(style)(
            style,
            other?.style,
            t,
          ) ??
          style) as T,
    );
  }
}
