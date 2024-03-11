import 'package:flutter/material.dart';

/// The HexColor class converts a hexadecimal color code to an integer color value.
class HexColor extends Color {
  /// The function `_getColorFromHex` converts a hexadecimal color code to an integer representation.
  /// 
  /// Args:
  ///   hexColor (String): A string representing a hexadecimal color value.
  /// 
  /// Returns:
  ///   The method is returning an integer value representing the color obtained from the given
  /// hexadecimal color code.
  static int _getColorFromHex(String hexColor) {
    int length = 6;
    hexColor = hexColor.toUpperCase().replaceAll("#", "").padRight(length, "0");
    hexColor = hexColor.substring(0, length);
    hexColor = "FF$hexColor";

    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
