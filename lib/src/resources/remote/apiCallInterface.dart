import 'dart:io';

import 'package:club_house/src/models/BaseResponse.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/models/Notification.dart';
import 'package:club_house/src/models/SendSms.dart';
import 'package:club_house/src/models/VerifySms.dart';
import 'package:club_house/src/models/WaitList.dart';
import 'package:club_house/src/utils/const.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'apiCallInterface.g.dart';

@RestApi(baseUrl: Const.baseUrl)
abstract class ApiCallInterface {
  factory ApiCallInterface(Dio dio, {String baseUrl}) = _ApiCallInterface;

  /* <=============== Auth ===============> */

  // send sms for first time
  @POST("/start_phone_number_auth")
  Future<SendSms> sendSms(
    @Part(value: "phone_number", contentType: 'application/json') String phone,
  );

  // send sms for 3th time
  @POST("/resend_phone_number_auth")
  Future<SendSms> resendSms(
    @Part(value: "phone_number", contentType: 'application/json') String phone,
  );

  // make phone call to say code
  @POST("/call_phone_number_auth")
  Future<SendSms> makeCall(
    @Part(value: "phone_number", contentType: 'application/json') String phone,
  );

  // verify received code
  @POST("/complete_phone_number_auth")
  Future<VerifySms> verifyCode(
    @Part(value: "phone_number", contentType: 'application/json') String phone,
    @Part(value: "verification_code", contentType: 'application/json') String code,
  );

  /* <=============== Profile ===============> */

  // check user is in wait list for receive an invite
  @POST("/check_waitlist_status")
  Future<WaitList> isWaitList();

  // update user name
  @POST("/update_name")
  Future<BaseResponse> updateName(@Part(value: "name", contentType: 'application/json',) String name);

  // update user name
  @POST("/update_username")
  Future<BaseResponse> updateUserName(@Part(value: "username", contentType: 'application/json',) String username);

  // update user propic
  @POST("/update_username")
  @MultiPart()
  Future<BaseResponse> updatePropic(@Part(value: "file") File file);


  /* <=============== Broadcast ===============> */

  // get user notifications
  @GET("/get_notifications")
  Future<NotificationResponse> getNotifications(@Query('user_id') int UserId,@Query('page') int page,{@Query('page_size') int pageSize = 50});

  // get user event
  @POST("/get_event")
  Future<BaseResponse> getEvents(@Part(value: "event_hashid", contentType: 'application/json',) String eventId);

  // get user channels
  @GET("/get_channels")
  Future<ChannelResponse> getChannels();
  

}
