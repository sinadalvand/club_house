// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiCallInterface.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiCallInterface implements ApiCallInterface {
  _ApiCallInterface(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://www.clubhouseapi.com/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<SendSms> sendSms(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone_number', phone));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/start_phone_number_auth',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SendSms.fromJson(_result.data);
    return value;
  }

  @override
  Future<SendSms> resendSms(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone_number', phone));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/resend_phone_number_auth',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SendSms.fromJson(_result.data);
    return value;
  }

  @override
  Future<SendSms> makeCall(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone_number', phone));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/call_phone_number_auth',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SendSms.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifySms> verifyCode(phone, code) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(code, 'code');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone_number', phone));
    }
    if (code != null) {
      _data.fields.add(MapEntry('verification_code', code));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/complete_phone_number_auth',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifySms.fromJson(_result.data);
    return value;
  }

  @override
  Future<FullUserResponse> getProfile(userid) async {
    ArgumentError.checkNotNull(userid, 'userid');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (userid != null) {
      _data.fields.add(MapEntry('user_id', userid.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/get_profile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = FullUserResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<Followers> getFollowers(UserId, page, {pageSize = 50}) async {
    ArgumentError.checkNotNull(UserId, 'UserId');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': UserId,
      r'page': page,
      r'page_size': pageSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/get_followers',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Followers.fromJson(_result.data);
    return value;
  }

  @override
  Future<Following> getFollowing(UserId, page, {pageSize = 50}) async {
    ArgumentError.checkNotNull(UserId, 'UserId');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': UserId,
      r'page': page,
      r'page_size': pageSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/get_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Following.fromJson(_result.data);
    return value;
  }

  @override
  Future<WaitList> isWaitList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/check_waitlist_status',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = WaitList.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> updateName(name) async {
    ArgumentError.checkNotNull(name, 'name');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/update_name',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> updateUserName(username) async {
    ArgumentError.checkNotNull(username, 'username');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (username != null) {
      _data.fields.add(MapEntry('username', username));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/update_username',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> updateBio(bio) async {
    ArgumentError.checkNotNull(bio, 'bio');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (bio != null) {
      _data.fields.add(MapEntry('bio', bio));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/update_bio',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> updatePropic(file) async {
    ArgumentError.checkNotNull(file, 'file');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.request<Map<String, dynamic>>('/update_username',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> inviteUserToApp(phone, {name = "", message = ""}) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone_number', phone));
    }
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (message != null) {
      _data.fields.add(MapEntry('message', message));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/invite_to_app',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> followUser(userId, {source = 4}) async {
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = FormData();
    if (userId != null) {
      _data.fields.add(MapEntry('user_id', userId.toString()));
    }
    if (source != null) {
      _data.fields.add(MapEntry('source', source.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/follow',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> unfollowUser(userId) async {
    ArgumentError.checkNotNull(userId, 'userId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (userId != null) {
      _data.fields.add(MapEntry('user_id', userId.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/unfollow',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<NotificationResponse> getNotifications(UserId, page,
      {pageSize = 50}) async {
    ArgumentError.checkNotNull(UserId, 'UserId');
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'user_id': UserId,
      r'page': page,
      r'page_size': pageSize
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/get_notifications',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = NotificationResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<BaseResponse> getEvents(eventId) async {
    ArgumentError.checkNotNull(eventId, 'eventId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (eventId != null) {
      _data.fields.add(MapEntry('event_hashid', eventId));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/get_event',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = BaseResponse.fromJson(_result.data);
    return value;
  }

  @override
  Future<ChannelResponse> getChannels() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/get_channels',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ChannelResponse.fromJson(_result.data);
    return value;
  }
}
