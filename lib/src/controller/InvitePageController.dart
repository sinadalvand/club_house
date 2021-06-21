import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InvitePageController extends Controller {

  ProfileRepository _profileRepository = Get.find();

  // code container
  String phone;

  // user country code
  String countryCode;

  // status
  String status ="";

  final phoneInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  submit() {
    final phone = countryCode + countryCode;
    _profileRepository.inviteUser(phone).then((value) {
      if (value.success){
        status = "invite_sent".tr;
      }else{
        status = "invite_not_sent".tr;
      }
      update();
    }, onError: () {
      status = "invite_not_sent".tr;
      update();
    });
  }
}
