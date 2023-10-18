import 'package:flutter/material.dart';

import 'app_colors.dart';

class TextFieldTheme extends ThemeExtension<TextFieldTheme> {
  const TextFieldTheme({
    required this.defaultInputStyle,
    required this.errorInputStyle,
    required this.defaultLabelStyle,
    required this.errorLabelStyle,
    required this.errorTextStyle,
  });

  final TextStyle defaultInputStyle;
  final TextStyle errorInputStyle;
  final TextStyle defaultLabelStyle;
  final TextStyle errorLabelStyle;
  final TextStyle errorTextStyle;

  @override
  ThemeExtension<TextFieldTheme> copyWith({
    TextStyle? defaultInputStyle,
    TextStyle? errorInputStyle,
    TextStyle? defaultLabelStyle,
    TextStyle? errorLabelStyle,
    TextStyle? errorTextStyle,
  }) {
    return TextFieldTheme(
      defaultInputStyle: defaultInputStyle ?? this.defaultInputStyle,
      errorInputStyle: errorInputStyle ?? this.errorInputStyle,
      defaultLabelStyle: defaultLabelStyle ?? this.defaultLabelStyle,
      errorLabelStyle: errorLabelStyle ?? this.errorLabelStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
    );
  }

  @override
  ThemeExtension<TextFieldTheme> lerp(
      covariant ThemeExtension<TextFieldTheme>? other, double t) {
    if (other is! TextFieldTheme) {
      return this;
    }

    return TextFieldTheme(
      defaultInputStyle:
          TextStyle.lerp(defaultInputStyle, other.defaultInputStyle, t)!,
      errorInputStyle:
          TextStyle.lerp(errorInputStyle, other.errorInputStyle, t)!,
      defaultLabelStyle:
          TextStyle.lerp(defaultLabelStyle, other.defaultLabelStyle, t)!,
      errorLabelStyle:
          TextStyle.lerp(errorLabelStyle, other.errorLabelStyle, t)!,
      errorTextStyle: TextStyle.lerp(errorTextStyle, other.errorTextStyle, t)!,
    );
  }

  static const styles = TextFieldTheme(
    defaultInputStyle: TextStyle(
      color: AppColors.darkGrey,
      fontSize: 16,
      decorationThickness: 0,
    ),
    errorInputStyle: TextStyle(
      color: AppColors.red,
      fontSize: 16,
      decorationThickness: 0,
    ),
    defaultLabelStyle: TextStyle(
      color: AppColors.grey,
      fontSize: 16,
      decorationThickness: 0,
    ),
    errorLabelStyle: TextStyle(
      color: AppColors.red,
      fontSize: 16,
      decorationThickness: 0,
    ),
    errorTextStyle: TextStyle(
      color: AppColors.red,
      fontSize: 12,
      decorationThickness: 0,
    ),
  );
}
