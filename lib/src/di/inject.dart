import 'package:club_house/src/models/Session.dart';
import 'package:club_house/src/repository/Valutor.dart';
import 'package:club_house/src/resources/remote/apiCallInterface.dart';
import 'package:club_house/src/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Inject {
  inject() {
    Get.putAsync(() => SharedPreferences.getInstance(), permanent: true);
    Get.put(ApiCallInterface(Get.find()), permanent: true);
    Get.put(Valutor(Get.find()), permanent: true);
    Get.put(Session(Get.find())..load(), permanent: true);
    Get.put(_getDio(Get.find()), permanent: true);
  }

  Dio _getDio(Session session) {
    final dio = Dio()
      //dynamic headers
      ..interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        var customHeaders = {
          'content-type': 'application/json',
          'CH-Locale': 'en_US',
          'CH-Languages': 'en-US',
          'Accept': 'application/json',
          'CH-AppBuild': Const.API_BUILD_ID,
          'CH-AppVersion': Const.API_BUILD_VERSION,
          'User-Agent': 'clubhouse/' + Const.API_BUILD_ID + ' (iPhone; iOS 13.5.1; Scale/3.00)',
          'CH-DeviceId': session.token,
        };
        options.headers.addAll(customHeaders);
        return options;
      }))
      // log all request
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
