import 'dart:ui';

import 'constants.dart';

class ColorPalettes {
  ColorPalettes({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
  });

  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  static final palette1 = ColorPalettes(
    color1: AppColors.grey,
    color2: AppColors.lightGreen,
    color3: AppColors.white,
    color4: AppColors.grey,
  );

  static final palette2 = ColorPalettes(
    color1: AppColors.lightBlue,
    color2: AppColors.blue,
    color3: AppColors.white,
    color4: AppColors.grey,
  );

  static final palette3 = ColorPalettes(
    color1: AppColors.lightBrown,
    color2: AppColors.orange,
    color3: AppColors.white,
    color4: AppColors.grey,
  );
}
