import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Utils {
  // convert hex to color
  static Color hex2color(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static bool isRtl(){
    final TextDirection currentDirection = Directionality.of(Get.context);
    return  currentDirection == TextDirection.rtl;
  }
}
