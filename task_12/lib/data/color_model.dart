import 'package:json_annotation/json_annotation.dart';

part 'color_model.g.dart';

@JsonSerializable()
class ColorModel {
  final String name;
  final String? value;

  ColorModel({
    required this.name,
    required this.value,
  });

  factory ColorModel.fromJson(Map<String, dynamic> json) =>
      _$ColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ColorModelToJson(this);

  @override
  String toString() {
    return 'ColorModel(name: $name, value: $value)';
  }
}
