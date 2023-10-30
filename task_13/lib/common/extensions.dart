import 'package:flutter/material.dart';

import '../data/shared_preferences_repository_impl.dart';
import '../data/theme_data_interface.dart';
import '../ui/themes/custom_theme_colors_extension.dart';
import 'dependency_container.dart';

extension DependencyExt on BuildContext {
  ThemeDataInterface get themeRepository {
    DependencyContainer.register(SharedPreferencesRepositoryImpl());
    return DependencyContainer.get<SharedPreferencesRepositoryImpl>();
  }
}

extension CustomColorsExt on BuildContext {
  CustomColors get color => Theme.of(this).extension<CustomColors>()!;
}
