import 'package:flutter/material.dart';

import '../themes/constants.dart';
import '../themes/custom_text_style.dart';
import 'custom_theme_colors_extension.dart';

abstract class CustomTheme {
  static final ThemeData base = ThemeData(
    fontFamily: CustomTextStyle.fontFamily,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        size: 24,
      ),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      elevation: 0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
    ),
  );

  static final ThemeData light1 = base.copyWith(
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.white,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light1,
    ],
  );

  static final ThemeData light2 = base.copyWith(
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.skyGrey,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light2,
    ],
  );

  static final ThemeData light3 = base.copyWith(
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.creamy,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.white,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.light3,
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.black,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.darkGrey,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark1,
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.darkBlue,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.blueGrey,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark2,
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
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      color: AppColors.darkBrown,
    ),
    bottomSheetTheme: base.bottomSheetTheme.copyWith(
      modalBackgroundColor: AppColors.greyBrown,
    ),
    extensions: const <ThemeExtension<dynamic>>[
      CustomColors.dark3,
    ],
  );
}
