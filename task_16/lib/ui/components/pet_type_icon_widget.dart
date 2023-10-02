import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_courses_template/ui/themes/extensions.dart';

class PetTypeIconWidget extends StatelessWidget {
  const PetTypeIconWidget({
    super.key,
    required this.petSvgIcon,
    required this.petType,
    required this.isSelected,
  });

  final String petSvgIcon;
  final String petType;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colors = context.petIconColors;

    return Column(
      children: [
        SizedBox(
          height: 72,
          width: 72,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected ? colors.activeBg : colors.inActiveBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  petSvgIcon,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? colors.activeFg
                        : colors.inActiveFg,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(petType),
      ],
    );
  }
}
