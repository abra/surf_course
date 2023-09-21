import 'package:flutter/material.dart';

import '../themes/constants.dart';
import '../themes/custom_text_style.dart';
import 'custom_theme_extensions.dart';

abstract class CustomTheme {
  static final ThemeData _default = ThemeData(
    fontFamily: CustomTextStyle.fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
    ),
  );

  static final ThemeData light1 = _default.copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.darkGrey,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.darkGrey,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.white,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.darkGrey,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.lightGreen,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.lightGreen,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightGreen,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.lightGreen;
        }
        return AppColors.darkGrey;
      }),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.bluePurple,
        textStyle: CustomTextStyle.h2,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.red),
        foregroundColor: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.light1,
    ],
  );

  static final ThemeData light2 = _default.copyWith(
    scaffoldBackgroundColor: AppColors.skyGrey,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.darkGrey,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.darkGrey,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.skyGrey,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.darkBlue,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.blue,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.blue,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.blue,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.blue;
        }
        return AppColors.darkGrey;
      }),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.blue,
        textStyle: CustomTextStyle.h2,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.red),
        foregroundColor: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.light2,
    ],
  );

  static final ThemeData light3 = _default.copyWith(
    scaffoldBackgroundColor: AppColors.creamy,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.darkGrey,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.darkGrey,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.creamy,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.darkBrown,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.orange,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.orange,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.orange,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.orange;
        }
        return AppColors.darkGrey;
      }),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.orange,
        textStyle: CustomTextStyle.h2,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.red),
        foregroundColor: AppColors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.light3,
    ],
  );

  static final ThemeData dark1 = light1.copyWith(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.black,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.lightGreen,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.lightGreen,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.lightGreen,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.lightGreen;
        }
        return AppColors.grey;
      }),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.darkGrey,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.dark1,
    ],
  );

  static final ThemeData dark2 = light2.copyWith(
    scaffoldBackgroundColor: AppColors.darkBlue,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkBlue,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.blue,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.blue,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.blue,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.blue;
        }
        return AppColors.lightBlue;
      }),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.blueGrey,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.dark2,
    ],
  );

  static final ThemeData dark3 = light3.copyWith(
    scaffoldBackgroundColor: AppColors.darkBrown,
    textTheme: TextTheme(
      displayLarge: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      displayMedium: CustomTextStyle.h2.copyWith(
        color: AppColors.white,
      ),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkBrown,
      titleTextStyle: CustomTextStyle.h1.copyWith(
        color: AppColors.white,
      ),
      toolbarTextStyle: CustomTextStyle.h3.copyWith(
        color: AppColors.orange,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.orange,
        size: 24,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.orange,
      size: 15,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.orange;
        }
        return AppColors.lightBrown;
      }),
    ),
    bottomSheetTheme: _default.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.greyBrown,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomThemeColors.dark3,
    ],
  );
}
