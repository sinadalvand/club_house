import 'package:club_house/src/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiCallInterface.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiCallInterface {
  factory ApiCallInterface(Dio dio, {String baseUrl}) = _ApiCallInterface;
}
