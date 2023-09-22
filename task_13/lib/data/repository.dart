import '../ui/themes/app_theme.dart';

abstract interface class Repository {
  Future<AppTheme> getTheme();

  Future<void> saveTheme(AppTheme appTheme);
}
