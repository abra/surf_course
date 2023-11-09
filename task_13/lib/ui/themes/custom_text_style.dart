import 'package:flutter/material.dart';

abstract class CustomTextStyle {
  static const fontFamily = 'SF Pro Display';

  static const h1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    fontFamily: fontFamily,
  );

  static const h2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: fontFamily,
  );

  static const h3 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    fontFamily: fontFamily,
  );

  static const h4 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: fontFamily,
  );
}
