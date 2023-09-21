import 'package:flutter/material.dart';

import 'data/shared_preferences_repository_impl.dart';
import 'ui/managers/theme_manager.dart';
import 'ui/pages/profile_screen_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ThemeManager(
      repo: SharedPreferencesRepositoryImpl(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileScreenWidget();
  }
}
