import 'package:flutter/material.dart';

import '../../data/theme_data_interface.dart';
import '../themes/app_theme.dart';
import '../themes/custom_theme.dart';
import 'theme_provider.dart';

class ThemeManager extends StatefulWidget {
  final ThemeDataInterface repo;
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
  late final ThemeDataInterface repo;
  late final Widget child;

  AppTheme? _appTheme;
  ThemeMode _themeMode = ThemeMode.system;
  ThemeData _lightTheme = CustomTheme.light1;
  ThemeData _darkTheme = CustomTheme.dark1;

  AppTheme get currentAppTheme => _appTheme!;

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
    AppTheme savedTheme = await repo.getTheme();
    _setTheme(savedTheme);
  }

  void switchTheme(AppTheme theme) {
    _setTheme(theme);
  }

  void _setTheme(AppTheme theme) {
    _appTheme = theme;

    setState(() {
      switch (theme) {
        case AppTheme.light1:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light1;
          break;
        case AppTheme.light2:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light2;
          break;
        case AppTheme.light3:
          _themeMode = ThemeMode.light;
          _lightTheme = CustomTheme.light3;
          break;
        case AppTheme.dark1:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark1;
          break;
        case AppTheme.dark2:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark2;
          break;
        case AppTheme.dark3:
          _themeMode = ThemeMode.dark;
          _darkTheme = CustomTheme.dark3;
          break;
        case AppTheme.system:
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
