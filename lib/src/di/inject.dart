import 'package:club_house/main.dart';
import 'package:club_house/src/resources/remote/apiCallInterface.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Inject {
  inject() {
    Get.put(_getDio(), permanent: true);
    Get.put(ApiCallInterface(Get.find()), permanent: true);
  }

  Dio _getDio() {
    final dio = Dio();

    // set interceptor
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      var uuid = Uuid();
      var customHeaders = {
        'content-type': 'application/json',
        'CH-Locale':'en_US',
        'CH-Languages':'en-US',
        'Accept':'application/json',
        'CH-AppBuild':'304',
        'CH-AppVersion':'0.1.28',
        'User-Agent':'clubhouse/304 (iPhone; iOS 13.5.1; Scale/3.00)',
        'CH-DeviceId':uuid.v4(),
      };
      options.headers.addAll(customHeaders);
      return options;
    }));

    // log all request
    dio.interceptors.add(LogInterceptor(requestBody: true,responseBody: true));

    return dio;
  }
}
