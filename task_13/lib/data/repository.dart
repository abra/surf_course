import '../ui/themes/app_theme_mode.dart';

abstract interface class Repository {
  Future<AppThemeMode> getTheme();

  Future<void> saveTheme(AppThemeMode appTheme);
}
