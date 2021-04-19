import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullNamePageController extends Controller {

  final _profileRepository = Get.find<ProfileRepository>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameFormKey = GlobalKey<FormState>();
  final lastNameFormKey = GlobalKey<FormState>();

  Function onNextButtonClick;

  var firstName = "";
  var lastName = "";

  setFirstName(String name) {
    firstName = name;
    _checkInputToNext();
  }

  setLastName(String name) {
    lastName = name;
    _checkInputToNext();
  }

  _checkInputToNext(){
    if (_isInputValid(firstName.trim()) && _isInputValid(lastName.trim())){
      onNextButtonClick = requestToSubmit();
    }else{
      onNextButtonClick = null;
    }
  }

  requestToSubmit() {
    //combine name and family to set as user name in profile
    _sendRequest(this.firstName + ' ' + this.lastName);
  }

  _sendRequest(String finalName) {
    _profileRepository.updateName(finalName).then((value) {
      if(value.success){
        valutor.name =finalName;
        Get.offAllNamed(Director.REGISTER_USERNAME.route);
      }else{
        Get.snackbar("error".tr, "در ثبت اطلاعات از سمت سرور مشکلی رخ داده!");
      }
    }).onError((error, stackTrace){
      Get.snackbar("error".tr, "در ثبت اطلاعات از سمت سرور مشکلی رخ داده!");
      return;
    });
  }


  bool _isInputValid(String input) {
    return input.length > 2;
  }
}
