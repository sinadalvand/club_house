import 'dart:async';

import 'package:club_house/main.dart';
import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/AuthRepository.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:countdown/countdown.dart';
import 'package:get/get.dart';

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

  // director to another page
  final director = Rx<Director>();

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
    resendCount > 2 ? makePhoneCall() : sendSms();
  }

  sendSms() {
    _authRepository.resendSms(_phone).then((value) {
      Get.snackbar("success".tr, "sms_code_sent".tr);
    }).onError((error, stackTrace) {});
  }

  makePhoneCall() {
    _authRepository.makeCall(_phone).then((value) {
      Get.snackbar("success".tr, "we_will_call_you".tr);
    }).onError((error, stackTrace) {});
  }

  _verifyCode() {
    _authRepository.verifyCode(_phone, _code).then((value) {

     if(value.is_verified){
       // 1- save user token
       valutor.token = value.auth_token;
       // 2- save user id
       valutor.user_id = value.user_profile?.user_id ?? -1;
       // 3- is waited list
       valutor.waitedlist = value.is_waitlisted;

       // save user name in pref
       if (value.user_profile.name != null)
         valutor.name = value.user_profile.name;

       // save username in pref
       if (value.user_profile.username != null)
         valutor.username = value.user_profile.username;

       // if is waited list go to waited list
       // if username is in profile then go to register page
       // if everything i ok then go to main page
       if (valutor.name == null) {
         director.value = Director.REGISTER_NAME;
       } else if (valutor.username == null) {
         director.value = Director.REGISTER_USERNAME;
       } else if (valutor.waitedlist) {
         director.value = Director.WAIT_LIST;
       } else {
         director.value = Director.MAIN_PAGE;
       }
     }else{
       logger.e("timeout or wrong code");
       // TODO show can't enter error
     }

    }).onError((error, stackTrace) {
      stackTrace.printInfo();
      logger.e(error);
      //TODO handle error for verify
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
