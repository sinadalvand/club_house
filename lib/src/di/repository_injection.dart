import 'package:club_house/src/repository/AuthRepository.dart';
import 'package:club_house/src/repository/BroadcastRepository.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:club_house/src/repository/SearchRespository.dart';
import 'package:get/get.dart';

final Function repository_inject = () {

  Get.lazyPut(() => AuthRepository(),fenix: true);
  Get.lazyPut(() => ProfileRepository(),fenix: true);
  Get.lazyPut(() => BroadcastRepository(),fenix: true);
  Get.lazyPut(() => SearchRepository(),fenix: true);

};