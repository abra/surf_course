import '../ui/themes/app_theme_mode.dart';

abstract interface class Repository {
  Future<AppTheme> getTheme();

  Future<void> saveTheme(AppTheme appTheme);
}
