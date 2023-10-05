import 'package:flutter/material.dart';

import 'pet_icon_colors.dart';
import 'pet_text_field_theme.dart';

extension BuildContextExt on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  PetIconColors get petIconColors => Theme.of(this).extension<PetIconColors>()!;

  PetTextFieldTheme get petTextFieldTheme =>
      Theme.of(this).extension<PetTextFieldTheme>()!;
}
