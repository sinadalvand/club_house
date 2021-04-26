import 'package:club_house/src/repository/Valutor.dart';
import 'package:club_house/src/resources/remote/apiCallInterface.dart';
import 'package:get/get.dart';

class Repository {

  /* retrofit instance */
  ApiCallInterface api = Get.find();

  /* Valutor instance */
  Valutor valutor = Get.find();


}
