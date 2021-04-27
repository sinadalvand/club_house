import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  int user_id;
  String name;
  String photo_url;
  String username;

  User(this.user_id, this.name, this.photo_url, this.username);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class FullUser {
  int user_id;
  String name;
  String photo_url;
  String username;
  String dsplayname, bio, twitter, instagram;
  int numFollowers, num_following;
  bool follows_me, is_blocked_by_network;
  DateTime time_created;
  User invited_by_user_profile;

  // null = not following
  // 2 = following
  // other values = ?
  int notification_type;

  FullUser(this.user_id, this.name, this.photo_url, this.username, this.dsplayname, this.bio, this.twitter, this.instagram, this.num_following,
      this.numFollowers, this.follows_me, this.is_blocked_by_network, this.time_created, this.invited_by_user_profile);

  factory FullUser.fromJson(Map<String, dynamic> json) => _$FullUserFromJson(json);

  Map<String, dynamic> toJson() => _$FullUserToJson(this);
}


@JsonSerializable()
class FullUserResponse {
  FullUser user_profile;

  FullUserResponse(this.user_profile);

  factory FullUserResponse.fromJson(Map<String, dynamic> json) => _$FullUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FullUserResponseToJson(this);
}
