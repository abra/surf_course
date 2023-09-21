import 'package:flutter/material.dart';

import '../../data/repository.dart';
import '../themes/app_theme_mode.dart';
import '../themes/custom_theme.dart';
import 'theme_provider.dart';

class ThemeManager extends StatefulWidget {
  final Repository repo;
  final Widget child;

  const ThemeManager({
    super.key,
    required this.repo,
    required this.child,
  });

  @override
  ThemeManagerState createState() => ThemeManagerState();
}

class ThemeManagerState extends State<ThemeManager> {
  late final Repository repo;
  late final Widget child;

  AppThemeMode? _appTheme;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeData _lightTheme = CustomTheme.light1;
  ThemeData _darkTheme = CustomTheme.dark1;

  AppThemeMode get currentAppTheme => _appTheme!;

  ThemeMode get currentThemeMode => _themeMode;

  String get currentThemeModeName => switch (_themeMode) {
        ThemeMode.system => "Системная",
        ThemeMode.dark => "Тёмная",
        ThemeMode.light => "Светлая",
      };

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    repo = widget.repo;
    child = widget.child;
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    AppThemeMode savedTheme = await repo.getTheme();
    _setTheme(savedTheme);
  }

  void switchTheme(AppThemeMode theme) {
    _setTheme(theme);
  }

  void _setTheme(AppThemeMode theme) {
    _appTheme = theme;

    setState(() {
      switch (theme) {
        case AppThemeMode.light1:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light1;
          break;
        case AppThemeMode.light2:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light2;
          break;
        case AppThemeMode.light3:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light3;
          break;
        case AppThemeMode.dark1:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark1;
          break;
        case AppThemeMode.dark2:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark2;
          break;
        case AppThemeMode.dark3:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark3;
          break;
        case AppThemeMode.system:
          _themeMode = ThemeMode.system;
          _lightTheme = CustomTheme.light1;
          _darkTheme = CustomTheme.dark1;
          break;
      }
    });

    repo.saveTheme(theme);
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      state: this,
      child: MaterialApp(
        themeMode: _themeMode,
        theme: _lightTheme,
        darkTheme: _darkTheme,
        home: child,
      ),
    );
  }
}
