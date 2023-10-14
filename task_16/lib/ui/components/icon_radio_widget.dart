import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/data/pet_type.dart';
import '/ui/themes/extensions.dart';

class IconRadioWidget<T extends PetType> extends StatelessWidget {
  const IconRadioWidget({
    super.key,
    required this.value,
    required this.isSelected,
    required this.onChanged,
  });

  final T value;
  final bool isSelected;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => onChanged(value),
          child: SizedBox.square(
            dimension: 72,
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(196, 196, 196, 0.24),
                    offset: Offset(0, 18),
                    blurRadius: 16,
                    spreadRadius: -8,
                  ),
                ],
                color: isSelected
                    ? context.iconColors.activeBg
                    : context.iconColors.inActiveBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: SizedBox.square(
                  dimension: 32,
                  child: SvgPicture.asset(
                    value.petSvgIcon,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? context.iconColors.activeFg
                          : context.iconColors.inActiveFg,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value.petName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
