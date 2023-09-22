import 'package:flutter/material.dart';

import 'custom_theme_colors_extension.dart';

extension BuildContextExt on BuildContext {
  CustomColors get color => Theme.of(this).extension<CustomColors>()!;
}
