// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..userId = json['userId'] as int
    ..name = json['name'] as String
    ..photoUrl = json['photoUrl'] as String
    ..userName = json['userName'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'userName': instance.userName,
    };
