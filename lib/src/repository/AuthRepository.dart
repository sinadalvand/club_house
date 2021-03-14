import 'dart:convert';

import 'package:club_house/main.dart';
import 'package:club_house/src/contracts/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthRepository extends Repository {
  Dio dio = Get.find();

  void sendSms() {
    api.sendSms("+989398738141").then((value) {
      logger.d(value);
    });

    // Response response = await dio.post(url, data: json.encode(params));
    // dio
    //     .post(
    //       "https://www.clubhouseapi.com/api/start_phone_number_auth",
    //       data: json.encode(
    //         {"phone_number": "+989398738141"},
    //       ),
    //     )
    //     .then((value) => logger.d(value));
  }
}
