import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/themes/form_submit_button_theme.dart';

import 'app_colors.dart';
import 'icon_colors.dart';
import 'text_field_theme.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightRed,
      onPrimary: AppColors.white,
      background: AppColors.white,
      onBackground: AppColors.darkGrey,
      secondary: AppColors.lightRed,
      onSecondary: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.darkGrey,
      error: AppColors.red,
      onError: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
    fontFamily: 'SF Pro Text',
    checkboxTheme: CheckboxThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: MaterialStateProperty.resolveWith<Color>((
        Set<MaterialState> states,
      ) {
        if (!states.contains(MaterialState.selected)) {
          return AppColors.white;
        } else {
          return AppColors.lightRed;
        }
      }),
      checkColor: MaterialStateProperty.resolveWith<Color?>((
        Set<MaterialState> states,
      ) {
        if (!states.contains(MaterialState.selected)) {
          return AppColors.white;
        } else {
          return AppColors.white;
        }
      }),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
    ),
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
      ),
      yearStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        alignment: Alignment.center,
        side: MaterialStateProperty.all(BorderSide.none),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      labelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
      ),
      helperMaxLines: 1,
      helperStyle: TextStyle(
        color: AppColors.red,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      filled: true,
      fillColor: AppColors.white,
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        borderSide: BorderSide.none,
      ),
      errorStyle: TextStyle(
        color: AppColors.red,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    extensions: [
      IconColors.colors,
      TextFieldTheme.styles,
      FormSubmitButtonTheme.buttonTheme,
    ],
  );
}
