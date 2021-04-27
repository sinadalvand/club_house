import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/AuthRepository.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PhonePageController extends Controller {
  // auth repository
  AuthRepository _authRepository = Get.find();

  // next button listener
  Function onSignUpButtonClick;

  // tet change listener
  final phoneNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  // user country code
  String countryCode;

  // return result if user was blocked
  bool phoneBlocked = false;

  // final result that request was success or not
  final result = RxBool();

  // prepare next button to request code
  enableNextButton(callback) {
    phoneBlocked = false;
    onSignUpButtonClick = callback;
    update();
  }

  requestSendCode() {
    var phone = countryCode + phoneNumberController.text;
    _authRepository.sendSms(phone).then((value) {
      phoneBlocked = value.is_blocked;
      _gotoNextPage(value.success,phone: phone);
      update();
    }).onError((error, stackTrace) {
      _gotoNextPage(false);
      update();
    });
  }

  _gotoNextPage(result,{String phone}) {
    if (result) {
      Get.toNamed(Director.VERIFY_PHONE.route,parameters: {'phone':phone});
    } else {
      Get.snackbar("error".tr, "error_occurred".tr);
    }
  }
}
