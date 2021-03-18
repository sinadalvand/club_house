import 'package:club_house/src/controller/WelcomePageController.dart';
import 'package:club_house/src/view/phone_number_page.dart';
import 'package:get/get.dart';

final Function controller_inject = () {

  Get.lazyPut(() => WelcomePageController());
  Get.lazyPut(() => PhoneNumberPage());


};
