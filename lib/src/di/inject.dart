import 'package:club_house/src/di/repository_injection.dart';
import 'package:club_house/src/models/Session.dart';
import 'package:club_house/src/repository/Valutor.dart';
import 'package:club_house/src/resources/remote/apiCallInterface.dart';
import 'package:club_house/src/utils/const.dart';
import 'package:club_house/src/utils/io_adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Inject {
  inject() async {
    Get.put(GetStorage(), permanent: true);
    Get.put(Valutor(), permanent: true);
    Get.put(Session(Get.find())..load(), permanent: true);
    Get.put(_getDio(Get.find(), Get.find()), permanent: true);
    Get.put(ApiCallInterface(Get.find()), permanent: true);

    // inject repositories
    repository_inject();
  }

  Dio _getDio(Session session, Valutor valutor) {
    // httpClient.

    final dio = Dio()
      ..httpClientAdapter = SmartHttpClientAdapter()
      ..interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        var customHeaders = {
          'content-type': 'application/json',
          'CH-Locale': 'en_US',
          'CH-Languages': 'en-US',
          'Accept': 'application/json',
          'CH-AppBuild': Const.API_BUILD_ID,
          'CH-AppVersion': Const.API_BUILD_VERSION,
          'User-Agent': 'clubhouse/' + Const.API_BUILD_ID + ' (iPhone; iOS 13.5.1; Scale/3.00)',
          'CH-DeviceId': session.deviceId,
        };

        if (valutor.token != null) customHeaders['Authorization'] = "Token " + valutor.token;

        if (valutor.user_id != null) customHeaders['CH-UserID'] = valutor.user_id.toString();

        options.headers.addAll(customHeaders);
        return options;
      }))
      // log all request
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    return dio;
  }
}
