import 'package:flutter/material.dart';

class CrystalBallWidget extends StatefulWidget {
  const CrystalBallWidget({
    super.key,
  });

  @override
  State<CrystalBallWidget> createState() => _CrystalBallWidgetState();
}

class _CrystalBallWidgetState extends State<CrystalBallWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.of(context).size.width - 40,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sphere.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
