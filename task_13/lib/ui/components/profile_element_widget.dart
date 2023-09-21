import 'package:flutter/material.dart';

import '../themes/custom_theme_extensions.dart';

class ProfileElementWidget extends StatelessWidget {
  const ProfileElementWidget({
    super.key,
    required this.title,
    required this.text,
    this.onTap,
  });

  final String title;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final customThemeColors = Theme.of(context).extension<CustomThemeColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: customThemeColors.profileElementBackground,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: customThemeColors.profileElementTitle,
                      ),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        color: customThemeColors.profileElementText,
                      ),
                    ),
                  ],
                ),
                onTap != null
                    ? const Icon(Icons.arrow_forward_ios)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
