import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UsernamePageController extends Controller {

  final _profileRepository = Get.find<ProfileRepository>();

  final userNameController = TextEditingController();
  final userNameformKey = GlobalKey<FormState>();

  Function onNextButtonClick;

  var _username = "";

  setUsername(String username) {
    this._username = username;
    _nextButtonValidation();
  }

  _nextButtonValidation() {
    if (_username
        .trim()
        .length > 2) {
      onNextButtonClick = _sendRequest;
    } else {
      onNextButtonClick = null;
    }
    update();
  }

  _sendRequest() {
    _profileRepository.updateUserName(_username).then((value) {
      if(value.success){
        valutor.username = _username;
      }else{
        //TODO check in we enter exist id
        Get.snackbar("error".tr, "در ثبت اطلاعات از سمت سرور مشکلی رخ داده!");
      }
    }).onError((error, stackTrace) {
      Get.snackbar("error".tr, "در ثبت اطلاعات از سمت سرور مشکلی رخ داده!");
    });
  }


}
