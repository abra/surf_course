import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'pet_icon_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightGrey,
    primaryColor: AppColors.darkGrey,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
    ),
    extensions: const [
      PetIconColors.colors,
    ]
  );
}