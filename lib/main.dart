import 'package:club_house/src/app.dart';
import 'package:club_house/src/di/inject.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {

  Inject().inject();
  runApp(MyApp());
}
