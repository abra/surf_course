import 'package:flutter/material.dart';

import 'constants.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.profileElementBackground,
    required this.mutedForeground,
    required this.primaryForeground,
    required this.paletteElementBackground,
    required this.paletteElementBorder,
  });

  final Color? profileElementBackground;
  final Color? mutedForeground;
  final Color? primaryForeground;
  final Color? paletteElementBackground;
  final Color? paletteElementBorder;

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? profileElementBgColor,
    Color? mutedFgColor,
    Color? primaryFgColor,
    Color? paletteElementBgColor,
    Color? paletteElementBorderColor,
  }) {
    return CustomColors(
      profileElementBackground:
          profileElementBgColor ?? profileElementBackground,
      mutedForeground: mutedFgColor ?? mutedForeground,
      primaryForeground: primaryFgColor ?? primaryForeground,
      paletteElementBackground: paletteElementBgColor ?? paletteElementBgColor,
      paletteElementBorder:
          paletteElementBorderColor ?? paletteElementBorderColor,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      profileElementBackground: Color.lerp(
        profileElementBackground,
        other.profileElementBackground,
        t,
      ),
      mutedForeground: Color.lerp(
        mutedForeground,
        other.mutedForeground,
        t,
      ),
      primaryForeground: Color.lerp(
        primaryForeground,
        other.primaryForeground,
        t,
      ),
      paletteElementBackground: Color.lerp(
        paletteElementBackground,
        other.paletteElementBackground,
        t,
      ),
      paletteElementBorder: Color.lerp(
        paletteElementBorder,
        other.paletteElementBorder,
        t,
      ),
    );
  }

  static const light1 = CustomColors(
    profileElementBackground: AppColors.whiteSilver,
    mutedForeground: AppColors.grey,
    primaryForeground: AppColors.darkGrey,
    paletteElementBackground: AppColors.lightSilver,
    paletteElementBorder: AppColors.lightGreen,
  );

  static const light2 = CustomColors(
    profileElementBackground: AppColors.white,
    mutedForeground: AppColors.lightBlue,
    primaryForeground: AppColors.darkBlue,
    paletteElementBackground: AppColors.white2,
    paletteElementBorder: AppColors.blue,
  );

  static const light3 = CustomColors(
    profileElementBackground: AppColors.white,
    mutedForeground: AppColors.lightBrown,
    primaryForeground: AppColors.darkBrown,
    paletteElementBackground: AppColors.paleIvory,
    paletteElementBorder: AppColors.orange,
  );

  static const dark1 = CustomColors(
    profileElementBackground: AppColors.darkGrey,
    mutedForeground: AppColors.grey,
    primaryForeground: AppColors.white,
    paletteElementBackground: AppColors.charcoalGrey,
    paletteElementBorder: AppColors.lightGreen,
  );

  static const dark2 = CustomColors(
    profileElementBackground: AppColors.blueGrey,
    mutedForeground: AppColors.lightBlue,
    primaryForeground: AppColors.white,
    paletteElementBackground: AppColors.greyBlue,
    paletteElementBorder: AppColors.blue,
  );

  static const dark3 = CustomColors(
    profileElementBackground: AppColors.greyBrown,
    mutedForeground: AppColors.lightBrown,
    primaryForeground: AppColors.white,
    paletteElementBackground: AppColors.mochaBrown,
    paletteElementBorder: AppColors.orange,
  );
}
