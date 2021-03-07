// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    authToken: json['authToken'] as String,
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    isWaitlisted: json['isWaitlisted'] as bool,
    userProfile: json['userProfile'] as bool,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'authToken': instance.authToken,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'isWaitlisted': instance.isWaitlisted,
      'userProfile': instance.userProfile,
    };
