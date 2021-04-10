// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VerifySms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifySms _$VerifySmsFromJson(Map<String, dynamic> json) {
  return VerifySms(
    json['is_waitlisted'] as bool,
    json['auth_token'] as String,
    json['access_token'] as String,
    json['refresh_token'] as String,
    json['user_profile'] == null
        ? null
        : User.fromJson(json['user_profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VerifySmsToJson(VerifySms instance) => <String, dynamic>{
      'is_waitlisted': instance.is_waitlisted,
      'auth_token': instance.auth_token,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'user_profile': instance.user_profile,
    };
