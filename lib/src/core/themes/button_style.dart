import 'package:flutter/material.dart';

class ButtonStyleExt<T> extends ThemeExtension<ButtonStyleExt<T>> {
  final ButtonStyle style;
  ButtonStyleExt([this.style = const ButtonStyle()]);

  @override
  ButtonStyleExt<T> copyWith([ButtonStyle? style]) {
    return ButtonStyleExt<T>(
      this.style.merge(style),
    );
  }

  @override
  ButtonStyleExt<T> lerp(covariant ButtonStyleExt<T>? other, double t) {
    return ButtonStyleExt<T>(ButtonStyle.lerp(style, other?.style, t) ?? style);
  }
}
