import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  String authToken;
  String accessToken;
  String refreshToken;
  bool isWaitlisted;
  bool userProfile;

  Auth({this.authToken, this.accessToken, this.refreshToken, this.isWaitlisted, this.userProfile});

  // factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
