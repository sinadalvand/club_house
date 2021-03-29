import 'package:club_house/src/controller/PhonePageController.dart';
import 'package:club_house/src/controller/PhoneVerifyController.dart';
import 'package:club_house/src/controller/WelcomePageController.dart';
import 'package:get/get.dart';

final Function controller_inject = () {

  Get.lazyPut(() => WelcomePageController());
  Get.lazyPut(() => PhonePageController());
  Get.lazyPut(() => PhoneVerifyController());


};
