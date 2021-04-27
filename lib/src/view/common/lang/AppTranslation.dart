import 'dart:ui';

import 'package:get/get.dart';
import 'en_US.dart';
import 'fa_IR.dart';

//AppTranslation.dart
class AppTranslation extends Translations {

  // static final locale = Locale('en', 'US');
  static final locale = Locale('fa', 'IR');

  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US':en_US,
    'fa_IR':fa_IR,
  };
}

