import 'package:flutter/material.dart';

extension CustomStyleThemeExtension on ThemeData {
  custom<T>(String name) {
    return (extensions[name] as CustomStyle?)?.style as T?;
  }
}

class CustomStyle<T> extends ThemeExtension<CustomStyle<T>> {
  final T style;
  final String? name;
  CustomStyle({this.name, required this.style});

  @override
  Object get type => name ?? T;

  @override
  CustomStyle<T> copyWith({String? name, T? style}) {
    switch (T) {
      case ButtonStyle:
        return CustomStyle(
          name: name ?? this.name,
          style: (this.style as ButtonStyle).merge(style as ButtonStyle?) as T,
        );
      case TextStyle:
        return CustomStyle(
          name: name ?? this.name,
          style: (this.style as TextStyle).merge(style as TextStyle) as T,
        );
    }

    return this;
  }

  @override
  CustomStyle<T> lerp(covariant CustomStyle<T>? other, double t) {
    switch (T) {
      case ButtonStyle:
        return CustomStyle(
            style: (ButtonStyle.lerp(
                  style as ButtonStyle,
                  other?.style as ButtonStyle?,
                  t,
                ) ??
                style) as T);
      case TextStyle:
        return CustomStyle(
            style: (TextStyle.lerp(
                  style as TextStyle,
                  other?.style as TextStyle?,
                  t,
                ) ??
                style) as T);
    }

    return this;
  }
}
