import 'package:flutter/material.dart';

import 'constants.dart';

class LoadingPageWidget extends StatelessWidget {
  const LoadingPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.4,
            child: Image.asset(appLogo),
          ),
          const SizedBox(height: 20),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
