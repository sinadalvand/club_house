import 'dart:io';

import 'package:club_house/src/models/BaseResponse.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/models/Notification.dart';
import 'package:club_house/src/models/SendSms.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/models/VerifySms.dart';
import 'package:club_house/src/models/WaitList.dart';
import 'package:club_house/src/models/Followers.dart';
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

  // get user profile
  @POST("/get_profile")
  Future<FullUserResponse> getProfile(@Part(value: "user_id", contentType: 'application/json',) int userid);

  // get user followers
  @GET("/get_followers")
  Future<Followers> getFollowers(@Query('user_id') int UserId,@Query('page') int page,{@Query('page_size') int pageSize = 50});

  // get user following
  @GET("/get_notifications")
  Future<Following> getFollowing(@Query('user_id') int UserId,@Query('page') int page,{@Query('page_size') int pageSize = 50});

  // check user is in wait list for receive an invite
  @POST("/check_waitlist_status")
  Future<WaitList> isWaitList();

  // update name of user
  @POST("/update_name")
  Future<BaseResponse> updateName(@Part(value: "name", contentType: 'application/json',) String name);

  // update username
  @POST("/update_username")
  Future<BaseResponse> updateUserName(@Part(value: "username", contentType: 'application/json',) String username);

  // update Bio
  @POST("/update_bio")
  Future<BaseResponse> updateBio(@Part(value: "bio", contentType: 'application/json',) String bio);

  // update user propic
  @POST("/update_username")
  @MultiPart()
  Future<BaseResponse> updatePropic(@Part(value: "file") File file);

  // invite user to app
  @POST("/invite_to_app")
  Future<BaseResponse> inviteUserToApp(
      @Part(value: "phone_number", contentType: 'application/json',) String phone,
      {@Part(value: "name", contentType: 'application/json',) String name="",
      @Part(value: "message", contentType: 'application/json',) String message=""}
      );

  // follow user
  @POST("/follow")
  Future<BaseResponse> followUser(@Part(value: "user_id", contentType: 'application/json',) int userId,{@Part(value: "source", contentType: 'application/json',) int source=4});

  // unfollow user
  @POST("/unfollow")
  Future<BaseResponse> unfollowUser(@Part(value: "user_id", contentType: 'application/json',) int userId);


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


  /* <=============== Room Management ===============> */

  // get special channel details
  @POST("/get_channel")
  Future<ChannelResponse> getChannel(@Part(value: "channel", contentType: 'application/json',) String channel);

  // get special channel details
  @POST("/join_channel")
  Future<Channel> joinChannel(
      @Part(value: "channel", contentType: 'application/json',) String channel,
      {@Part(value: "attributionSource", contentType: 'application/json',) String attributionSource = "feed",
      @Part(value: "attributionDetails", contentType: 'application/json',) String attributionDetails="eyJpc19leHBsb3JlIjpmYWxzZSwicmFuayI6MX0="}
      );

  // check user existence in channel
  @POST("/active_ping")
  Future<BaseResponse> checkUserExistence(@Part(value: "channel", contentType: 'application/json',) String channel);

  // accept user invite
  @POST("/accept_speaker_invite")
  Future<BaseResponse> acceptSpeakerInvite(@Part(value: "channel", contentType: 'application/json',) String channel,@Part(value: "user_id", contentType: 'application/json',) String userId);

  // accept user invite
  @POST("/audience_reply")
  Future<BaseResponse> audienceReply(@Part(value: "channel", contentType: 'application/json',) String channel,
      @Part(value: "raise_hands", contentType: 'application/json',) bool rise,
      @Part(value: "unraise_hands", contentType: 'application/json',) bool unrise,
      );



}
