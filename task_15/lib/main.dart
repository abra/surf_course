import 'package:flutter/material.dart';

import 'ui/pages/magic_ball_page_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MagicBallPageWidget(),
      ),
    );
  }
}
