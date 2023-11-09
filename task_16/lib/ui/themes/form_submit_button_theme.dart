import 'package:flutter/material.dart';

import 'app_colors.dart';

class FormSubmitButtonTheme extends ThemeExtension<FormSubmitButtonTheme> {
  const FormSubmitButtonTheme({
    required this.active,
    required this.inActive,
  });

  final ElevatedButtonThemeData active;
  final ElevatedButtonThemeData inActive;

  @override
  ThemeExtension<FormSubmitButtonTheme> copyWith({
    ElevatedButtonThemeData? active,
    ElevatedButtonThemeData? inActive,
  }) {
    return FormSubmitButtonTheme(
      active: active ?? this.active,
      inActive: inActive ?? this.inActive,
    );
  }

  @override
  ThemeExtension<FormSubmitButtonTheme> lerp(
      covariant ThemeExtension<FormSubmitButtonTheme>? other, double t) {
    if (other is! FormSubmitButtonTheme) {
      return this;
    }

    return FormSubmitButtonTheme(
      active: ElevatedButtonThemeData.lerp(active, other.active, t)!,
      inActive: ElevatedButtonThemeData.lerp(inActive, other.inActive, t)!,
    );
  }

  static FormSubmitButtonTheme buttonTheme = FormSubmitButtonTheme(
    active: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(16),
        shadowColor: MaterialStateProperty.all(
          const Color.fromRGBO(255, 128, 135, 0.24),
        ),
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            return const TextStyle(
              color: AppColors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            );
          },
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return AppColors.lightGrey;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return AppColors.lightRed;
          },
        ),
      ),
    ),
    inActive: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        animationDuration: const Duration(milliseconds: 0),
        splashFactory: NoSplash.splashFactory,
        shadowColor: null,
        alignment: Alignment.center,
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (Set<MaterialState> states) {
            return const TextStyle(
              color: AppColors.lightGrey,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            );
          },
        ),
        side: MaterialStateProperty.all(BorderSide.none),
        overlayColor: MaterialStateProperty.all(
          const Color.fromRGBO(255, 128, 135, 0.24),
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return AppColors.lightGrey;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            return AppColors.lightGrey2;
          },
        ),
      ),
    ),
  );
}
