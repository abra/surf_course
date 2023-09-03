import 'dart:convert';

import 'package:flutter/services.dart';

import 'color_model.dart';
import '../domain/color_repo.dart';

class ColorRepoImpl implements ColorRepo {
  @override
  Future<List<ColorModel>> getColors() async {
    // Emulate loading
    await Future.delayed(const Duration(seconds: 1));

    String data = await _loadAsset('assets/json/colors.json');

    final Map<String, dynamic> json = jsonDecode(data);

    if (json['colors'] != null) {
      final colors = <ColorModel>[];
      json['colors'].forEach((Map<String, dynamic> e) {
        if (e['value'] != null) {
          colors.add(ColorModel.fromJson(e));
        }
      });
      return colors;
    }
    return [];
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
