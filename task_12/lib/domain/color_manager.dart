import 'dart:ui';

import 'color_entity.dart';
import 'color_repo.dart';

class ColorManager {
  ColorManager({
    required this.repo,
  });

  final ColorRepo repo;

  Future<List<ColorEntity>> getColorList() async {
    final colors = await repo.getColors();
    final List<ColorEntity> colorList = colors
        .where((color) => _isValid(color.value!))
        .map(
          (color) => ColorEntity(
            name: color.name,
            hex: color.value!,
            color: _convertColor(color.value!),
          ),
        )
        .toList();
    return colorList;
  }

  bool _isValid(String hexColor) {
    final hexColorRegex = RegExp(r'^#?([0-9a-fA-F]{6}|[0-9a-fA-F]{3})$');
    return hexColorRegex.hasMatch(hexColor);
  }

  Color _convertColor(String hexColor) {
    return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
  }
}
