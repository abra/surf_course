import 'package:flutter/material.dart';

import '../themes/color_palettes.dart';
import '../themes/custom_text_style.dart';
import '../themes/extensions.dart';

class PaletteColorsElementWidget<T> extends StatelessWidget {
  const PaletteColorsElementWidget({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onChanged,
    required this.palette,
    required this.elementNumber,
  });

  final T value;
  final bool isSelected;
  final ValueChanged<T> onChanged;
  final ColorPalettes palette;
  final int elementNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          shape: BoxShape.rectangle,
          color: context.color.paletteElementBackground,
          border: Border.all(
            color: isSelected
                ? context.color.paletteElementBorder!
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.color1,
                          shape: BoxShape.circle,
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.color2,
                          shape: BoxShape.circle,
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.color3,
                          shape: BoxShape.circle,
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.color4,
                          shape: BoxShape.circle,
                        ),
                        child: const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Схема $elementNumber',
              style: CustomTextStyle.h4.copyWith(
                color: isSelected
                    ? context.color.primaryForeground
                    : context.color.mutedForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
