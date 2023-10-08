import 'package:flutter/material.dart';

import 'app_colors.dart';

class IconColors extends ThemeExtension<IconColors> {
  const IconColors({
    required this.activeBg,
    required this.activeFg,
    required this.inActiveBg,
    required this.inActiveFg,
  });

  final Color activeBg;
  final Color activeFg;
  final Color inActiveBg;
  final Color inActiveFg;

  @override
  ThemeExtension<IconColors> copyWith({
    Color? activeBg,
    Color? activeFg,
    Color? inActiveBg,
    Color? inActiveFg,
  }) {
    return IconColors(
      activeBg: activeBg ?? this.activeBg,
      activeFg: activeFg ?? this.activeFg,
      inActiveBg: inActiveBg ?? this.inActiveBg,
      inActiveFg: inActiveFg ?? this.inActiveFg,
    );
  }

  @override
  ThemeExtension<IconColors> lerp(
      covariant ThemeExtension<IconColors>? other, double t) {
    if (other is! IconColors) {
      return this;
    }

    return IconColors(
      activeBg: Color.lerp(activeBg, other.activeBg, t)!,
      activeFg: Color.lerp(activeFg, other.activeFg, t)!,
      inActiveBg: Color.lerp(inActiveBg, other.inActiveBg, t)!,
      inActiveFg: Color.lerp(inActiveFg, other.inActiveFg, t)!,
    );
  }

  static const colors = IconColors(
    activeBg: AppColors.lightRed,
    activeFg: AppColors.white,
    inActiveBg: AppColors.white,
    inActiveFg: AppColors.darkGrey,
  );
}
