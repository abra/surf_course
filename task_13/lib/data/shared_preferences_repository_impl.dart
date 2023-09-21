import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/themes/app_theme_mode.dart';
import '../ui/themes/constants.dart';
import 'repository.dart';

class SharedPreferencesRepositoryImpl implements Repository {
  @override
  Future<AppThemeMode> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    String? themeString = prefs.getString(appThemeValue);

    final appTheme = AppThemeMode.values.firstWhere(
      (theme) {
        return describeEnum(theme) == themeString;
      },
      orElse: () => AppThemeMode.system,
    );

    return appTheme;
  }

  @override
  Future<void> saveTheme(AppThemeMode appTheme) async {
    final prefs = await SharedPreferences.getInstance();

    if (appTheme != AppThemeMode.system) {
      await prefs.setString(appThemeValue, describeEnum(appTheme));
    } else {
      await prefs.setString(appThemeValue, '');
    }
  }
}
