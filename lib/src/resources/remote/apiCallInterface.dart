import 'package:club_house/src/models/SendSms.dart';
import 'package:club_house/src/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiCallInterface.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiCallInterface {
  factory ApiCallInterface(Dio dio, {String baseUrl}) = _ApiCallInterface;

  @POST("/start_phone_number_auth")
  Future<SendSms> sendSms(
    @Part(value: "phone_number", contentType: 'application/json') String phone,
  );

}
