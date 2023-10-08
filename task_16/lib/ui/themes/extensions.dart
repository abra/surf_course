import 'package:flutter/material.dart';

import 'icon_colors.dart';
import 'text_field_theme.dart';

extension BuildContextExt on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  IconColors get iconColors => Theme.of(this).extension<IconColors>()!;

  TextFieldTheme get textFieldTheme =>
      Theme.of(this).extension<TextFieldTheme>()!;
}
