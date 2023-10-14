import 'package:flutter/material.dart';

import '/ui/themes/form_submit_button_theme.dart';
import 'icon_colors.dart';
import 'text_field_theme.dart';

extension BuildContextExt on BuildContext {
  ThemeData get appTheme => Theme.of(this);

  IconColors get iconColors => Theme.of(this).extension<IconColors>()!;

  TextFieldTheme get textFieldTheme =>
      Theme.of(this).extension<TextFieldTheme>()!;

  FormSubmitButtonTheme get elevatedButtonTheme =>
      Theme.of(this).extension<FormSubmitButtonTheme>()!;
}
