import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/themes/app_theme.dart';
import '../ui/themes/constants.dart';
import 'theme_data_interface.dart';

class SharedPreferencesRepositoryImpl implements ThemeDataInterface {
  @override
  Future<AppTheme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString(appThemeValue);

    final appTheme = AppTheme.values.firstWhere(
      (theme) {
        return describeEnum(theme) == themeString;
      },
      orElse: () => AppTheme.system,
    );

    return appTheme;
  }

  @override
  Future<void> saveTheme(AppTheme appTheme) async {
    final prefs = await SharedPreferences.getInstance();

    if (appTheme != AppTheme.system) {
      await prefs.setString(appThemeValue, describeEnum(appTheme));
    } else {
      await prefs.setString(appThemeValue, '');
    }
  }
}
