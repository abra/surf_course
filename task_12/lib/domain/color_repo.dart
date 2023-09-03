import '../data/color_model.dart';

abstract interface class ColorRepo {
  Future<List<ColorModel>> getColors();
}
