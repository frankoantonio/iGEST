import 'package:flutter/material.dart';

// Extensión del "String" para convertir una cadena válida en "Color"
extension HexColor on String {
  /// Método para convertir cadena hexadecimal a color
  Color toColor() {
    String hexString = replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF$hexString"; // añade valor de opacidad si falta (FF = opacidad completa)
    }
    if (hexString.length != 8) {
      throw FormatException("Invalid hex color string: $this. Expected #RRGGBB or #AARRGGBB.");
    }
    return Color(int.parse(hexString, radix: 16));
  }
}
