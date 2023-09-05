import 'package:flutter/material.dart';

class ColorThumbnailWidget extends StatelessWidget {
  const ColorThumbnailWidget({
    super.key,
    required this.name,
    required this.color,
    required this.hex,
  });

  final String name;
  final Color color;
  final String hex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ColoredBox(
              color: color,
              child: const SizedBox.expand(),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(name),
        Text(hex),
        const SizedBox(height: 16),
      ],
    );
  }
}
