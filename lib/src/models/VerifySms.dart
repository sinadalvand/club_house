import 'package:json_annotation/json_annotation.dart';

import './User.dart';

part 'VerifySms.g.dart';

@JsonSerializable()
class VerifySms {

  bool is_waitlisted;
  String auth_token,access_token,refresh_token;
  User user_profile;
  bool is_verified;

  VerifySms(this.is_waitlisted, this.auth_token, this.access_token, this.refresh_token, this.user_profile,this.is_verified);

  factory VerifySms.fromJson(Map<String, dynamic> json) => _$VerifySmsFromJson(json);

  Map<String, dynamic> toJson() => _$VerifySmsToJson(this);
}
