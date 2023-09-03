import 'package:flutter/material.dart';

import '../../domain/color_manager.dart';

class ColorGridViewWidget extends StatelessWidget {
  const ColorGridViewWidget({
    super.key,
    required this.manager,
  });

  final ColorManager manager;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          //
        ]
      )
    );
  }
}
