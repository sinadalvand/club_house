import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Snacker {

  var _icon;

  show(String message, {String title}) {
    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      icon: _icon,
      titleText: title != null ? null : Center(),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(7),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.textTheme.bodyText2.color,
      colorText: Get.theme.scaffoldBackgroundColor,
    );
  }

  Snacker success() {
    _icon = Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 24.0,
      semanticLabel: 'success done',
    );
    return Snacker();
  }

  Snacker info() {
    _icon = Icon(
      Icons.info_rounded,
      color: Colors.lightBlue,
      size: 24.0,
      semanticLabel: 'info',
    );
    return Snacker();
  }

  Snacker error() {
    _icon = Icon(
      Icons.warning_rounded,
      color: Colors.red,
      size: 24.0,
      semanticLabel: 'info',
    );
    return Snacker();
  }
}
