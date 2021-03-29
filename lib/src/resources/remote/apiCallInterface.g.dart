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
}
