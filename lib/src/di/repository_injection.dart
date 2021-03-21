import 'package:club_house/src/repository/AuthRepository.dart';
import 'package:get/get.dart';

final Function repository_inject = () {

  Get.lazyPut(() => AuthRepository());

};