import 'color_model.dart';

abstract interface class ColorRepo {
  Future<List<ColorModel>> getColors();
}
