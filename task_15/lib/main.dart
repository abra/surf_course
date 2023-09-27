import 'package:flutter/material.dart';

import 'data/rest_api_repository_impl.dart';
import 'ui/pages/magic_ball_page_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MagicBallPageWidget(
          repository: RemoteApiRepositoryImpl(),
        ),
      ),
    );
  }
}
