import 'dart:async';
import 'dart:io';

import 'package:club_house/main.dart';
import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/AuthRepository.dart';
import 'package:countdown/countdown.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class PhoneVerifyController extends Controller {

  // doing resend , verify and call
  AuthRepository _authRepository = Get.find();



  // next click listener
  Function nextButtonFunction;

  // timer count down seconds
  var counter = 0.obs;

  // code container
  String _code;

  // phone from previous page
  String _phone = Get.parameters['phone'];

  // count of resend request
  var resendCount = 0.obs;

  // resend counter
  CountDown _counter;

  StreamSubscription<Duration> _sub;

  _configCounter() {
    _counter = CountDown(Duration(minutes: 1));
    _sub = _counter.stream.listen(null);
  }

  _startCounter() {
    _sub?.cancel();
    _configCounter();
    _sub.onData(_senderCounter);
    _sub.onDone(_senderDone);
  }

  // use to enable next button
  setEnterCode(String code, {int size = 4}) {
    this._code = code;
    nextButtonFunction = code.length == size ? _verifyCode : null;
    update();
  }

  resendCode() {
    _startCounter();
    resendCount > 2 ?  makePhoneCall() : sendSms();
  }

  sendSms() {
    _authRepository.resendSms(_phone).then((value) {
      Get.snackbar("success".tr, "sms_code_sent".tr);
    }).onError((error, stackTrace) {

    });
  }

  makePhoneCall() {
    _authRepository.makeCall(_phone).then((value) {
      Get.snackbar("success".tr, "we_will_call_you".tr);
    }).onError((error, stackTrace) {

    });
  }

  _verifyCode() {
    _authRepository.verifyCode(_phone, _code).then((value) {

      // 1- save user token
      valutor.token = value.auth_token;
      // 2- save user id
      valutor.user_id = value.user_profile?.user_id?.toString()??"";
      // 3- is waited list
      valutor.waitedlist = value.is_waitlisted;


      // if is waited list go to waited list
      // if username is in profile then go to register page
      // if everything i ok then go to main page
      if(value.is_waitlisted){
        logger.d("Waited");
        //TODO go to waited list
      }else if(value.user_profile?.user_id == null){
        logger.d("register");
        //TODO just need complete registration
      }else{
        logger.d("main menu");
        //TODO goto main menu
      }

    }).onError((error, stackTrace) {

    });
  }

  // notify time counter
  _senderCounter(Duration duration) {
    counter.value = duration.inSeconds;
  }

  _senderDone() {
    resendCount.value = resendCount.value + 1;
  }

  @override
  void onClose() {
    _sub?.cancel();
  }
}
