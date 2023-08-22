import 'package:flutter/material.dart';

extension SizedBoxExtension on double {
  kWidthSizedBox() {
    return SizedBox(
      width: this,
    );
  }

  kHeightSizedBox() {
    return SizedBox(
      height: this,
    );
  }
}

extension HexColor on Color {
  static Color fromHexConvert(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
