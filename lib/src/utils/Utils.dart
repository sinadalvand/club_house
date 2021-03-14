import 'dart:ui';

class Utils {
  // convert hex to color
  static Color hex2color(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
