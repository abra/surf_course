import 'color_model.dart';

abstract interface class ColorRepository {
  Future<List<ColorModel>> getColors();
}
