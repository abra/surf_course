import 'color_entity.dart';

abstract interface class ColorManager {
  Future<List<ColorEntity>> getColorList();
}
