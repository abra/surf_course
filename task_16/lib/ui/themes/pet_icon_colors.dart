import 'package:flutter/material.dart';

import 'app_colors.dart';

class PetIconColors extends ThemeExtension<PetIconColors> {
  const PetIconColors({
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
  ThemeExtension<PetIconColors> copyWith({
    Color? activeBg,
    Color? activeFg,
    Color? inActiveBg,
    Color? inActiveFg,
  }) {
    return PetIconColors(
      activeBg: activeBg ?? this.activeBg,
      activeFg: activeFg ?? this.activeFg,
      inActiveBg: inActiveBg ?? this.inActiveBg,
      inActiveFg: inActiveFg ?? this.inActiveFg,
    );
  }

  @override
  ThemeExtension<PetIconColors> lerp(
      covariant ThemeExtension<PetIconColors>? other, double t) {
    if (other is! PetIconColors) {
      return this;
    }

    return PetIconColors(
      activeBg: Color.lerp(activeBg, other.activeBg, t)!,
      activeFg: Color.lerp(activeFg, other.activeFg, t)!,
      inActiveBg: Color.lerp(inActiveBg, other.inActiveBg, t)!,
      inActiveFg:
          Color.lerp(inActiveFg, other.inActiveFg, t)!,
    );
  }

  static const colors = PetIconColors(
    activeBg: AppColors.lightRed,
    activeFg: AppColors.white,
    inActiveBg: AppColors.white,
    inActiveFg: AppColors.darkGrey,
  );

}
