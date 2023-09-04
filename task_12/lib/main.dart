import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/color_repo_impl.dart';
import 'ui/color_manager_impl.dart';
import 'ui/screens/color_grid_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: ColorGridViewWidget(
        manager: ColorManagerImpl(
          repo: ColorRepoImpl(),
        ),
      ),
    );
  }
}

