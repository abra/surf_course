import '../ui/themes/app_theme.dart';

abstract interface class ThemeDataInterface {
  Future<AppTheme> getTheme();

  Future<void> saveTheme(AppTheme appTheme);
}
