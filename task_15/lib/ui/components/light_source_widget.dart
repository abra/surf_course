import 'package:flutter/material.dart';

class LightSourceWidget extends StatelessWidget {
  const LightSourceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Image.asset(
        'assets/images/light_source.png',
      ),
    );
  }
}
