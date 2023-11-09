import 'package:flutter/material.dart';

import 'ui/managers/theme_manager.dart';
import 'ui/pages/profile_page_widget.dart';

void main() async {
  runApp(
    const ThemeManager(
      child: MainApp(),
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
