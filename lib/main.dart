import 'package:club_house/src/app.dart';
import 'package:club_house/src/di/inject.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() async {
  await GetStorage.init();

  Inject().inject();

  runApp(MyApp());
}
