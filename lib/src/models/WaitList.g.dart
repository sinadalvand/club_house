// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WaitList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaitList _$WaitListFromJson(Map<String, dynamic> json) {
  return WaitList(
    json['is_waitlisted'] as bool,
    json['is_onboarding'] as bool,
  );
}

Map<String, dynamic> _$WaitListToJson(WaitList instance) => <String, dynamic>{
      'is_waitlisted': instance.is_waitlisted,
      'is_onboarding': instance.is_onboarding,
    };
