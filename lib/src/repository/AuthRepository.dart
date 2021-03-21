
import 'dart:core';

import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/SendSms.dart';
import 'package:club_house/src/models/Session.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthRepository extends Repository {
  Dio dio = Get.find();
  Session session = Get.find();

  Future<SendSms> sendSms(String phone) {
    return api.sendSms(phone);

    // final client = HttpClient();
    // final request = await client.getUrl(Uri.parse("https://www.clubhouseapi.com/api/start_phone_number_auth"));
    // request.headers.add("content-type", "application/json");
    // request.headers.add("CH-Locale", "en_US");
    // request.headers.add("CH-Languages", "en-US");
    // request.headers.add("Accept", "application/json");
    // request.headers.add("CH-AppBuild", Const.API_BUILD_ID);
    // request.headers.add("CH-AppVersion", Const.API_BUILD_VERSION);
    // request.headers.add("User-Agent", 'clubhouse/' + Const.API_BUILD_ID + ' (iPhone; iOS 13.5.1; Scale/3.00)');
    // request.headers.add("CH-DeviceId", session.token);
    //
    // if (request is BrowserHttpClientRequest) {
    //   request.browserCredentialsMode = true;
    // }
    // return request.close();
  }
}
