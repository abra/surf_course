import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../pages/pet_registration_page_widget.dart';
import '../themes/extensions.dart';

class PetIconRadioWidget<T extends PetType> extends StatelessWidget {
  const PetIconRadioWidget({
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
                color: isSelected
                    ? context.petIconColors.activeBg
                    : context.petIconColors.inActiveBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: SizedBox.square(
                  dimension: 32,
                  child: SvgPicture.asset(
                    value.petSvgIcon,
                    colorFilter: ColorFilter.mode(
                      isSelected
                          ? context.petIconColors.activeFg
                          : context.petIconColors.inActiveFg,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(value.petName),
      ],
    );
  }
}
