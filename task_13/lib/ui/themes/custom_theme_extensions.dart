import 'package:flutter/material.dart';

import 'constants.dart';

class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  const CustomThemeColors({
    required this.profileElementBackground,
    required this.profileElementTitle,
    required this.profileElementText,
  });

  final Color? profileElementBackground;
  final Color? profileElementTitle;
  final Color? profileElementText;

  @override
  ThemeExtension<CustomThemeColors> copyWith({
    Color? backgroundColor,
    Color? titleColor,
    Color? valueColor,
  }) {
    return CustomThemeColors(
      profileElementBackground: backgroundColor ?? profileElementBackground,
      profileElementTitle: titleColor ?? profileElementTitle,
      profileElementText: valueColor ?? profileElementText,
    );
  }

  @override
  ThemeExtension<CustomThemeColors> lerp(
      ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }

    return CustomThemeColors(
      profileElementBackground: Color.lerp(
          profileElementBackground, other.profileElementBackground, t),
      profileElementTitle:
          Color.lerp(profileElementTitle, other.profileElementTitle, t),
      profileElementText:
          Color.lerp(profileElementText, other.profileElementText, t),
    );
  }

  static const base = CustomThemeColors(
    profileElementBackground: AppColors.whiteSilver,
    profileElementTitle: AppColors.bluePurple,
    profileElementText: AppColors.darkGrey,
  );

  static const light1 = CustomThemeColors(
    profileElementBackground: AppColors.whiteSilver,
    profileElementTitle: AppColors.grey,
    profileElementText: AppColors.darkGrey,
  );

  static const light2 = CustomThemeColors(
    profileElementBackground: AppColors.white,
    profileElementTitle: AppColors.lightBlue,
    profileElementText: AppColors.darkBlue,
  );

  static const light3 = CustomThemeColors(
    profileElementBackground: AppColors.white,
    profileElementTitle: AppColors.lightBrown,
    profileElementText: AppColors.darkBrown,
  );

  static const dark1 = CustomThemeColors(
    profileElementBackground: AppColors.darkGrey,
    profileElementTitle: AppColors.grey,
    profileElementText: AppColors.white,
  );

  static const dark2 = CustomThemeColors(
    profileElementBackground: AppColors.blueGrey,
    profileElementTitle: AppColors.lightBlue,
    profileElementText: AppColors.white,
  );

  static const dark3 = CustomThemeColors(
    profileElementBackground: AppColors.greyBrown,
    profileElementTitle: AppColors.lightBrown,
    profileElementText: AppColors.white,
  );
}
