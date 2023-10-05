import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'pet_icon_colors.dart';
import 'pet_text_field_theme.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightRed,
      onPrimary: AppColors.white,
    ),
    fontFamily: 'SF Pro Text',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightGrey,
    datePickerTheme: const DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      headerForegroundColor: AppColors.white,
      todayBorder: BorderSide.none,
      dayStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
      yearStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
      rangePickerHeaderBackgroundColor: Colors.orange,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 16,
      ),
      labelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
      helperMaxLines: 1,
      helperStyle: TextStyle(
        color: AppColors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'SF Pro Text',
      ),
      filled: true,
      fillColor: AppColors.white,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        borderSide: BorderSide.none,
      ),
      errorStyle: TextStyle(
        color: AppColors.red,
      ),
    ),
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
      PetTextFieldTheme.styles,
    ],
  );
}
