import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/ui/themes/pet_icon_colors.dart';

extension AppThemeExt on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  PetIconColors get petIconColors =>
      Theme.of(this).extension<PetIconColors>()!;
}
