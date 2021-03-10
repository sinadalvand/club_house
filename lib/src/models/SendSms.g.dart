// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SendSms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendSms _$SendSmsFromJson(Map<String, dynamic> json) {
  return SendSms(
    json['success'] as bool,
    json['is_blocked'] as bool,
    json['error_message'] as String,
  );
}

Map<String, dynamic> _$SendSmsToJson(SendSms instance) => <String, dynamic>{
      'success': instance.success,
      'is_blocked': instance.is_blocked,
      'error_message': instance.error_message,
    };
