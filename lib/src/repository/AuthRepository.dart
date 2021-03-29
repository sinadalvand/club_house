import 'dart:core';

import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/SendSms.dart';
import 'package:club_house/src/models/Session.dart';
import 'package:club_house/src/models/VerifySms.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthRepository extends Repository {
  Dio dio = Get.find();

  Session session = Get.find();

  Future<SendSms> sendSms(String phone) => api.sendSms(phone);

  Future<SendSms> resendSms(String phone) => api.resendSms(phone);

  Future<SendSms> makeCall(String phone) => api.makeCall(phone);

  Future<VerifySms> verifyCode(String phone,String code) => api.verifyCode(phone,code);
}
