import 'package:flutter/material.dart';

void main() {
  runApp(const PetHealthApp());
}

class PetHealthApp extends StatelessWidget {
  const PetHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
