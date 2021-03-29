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
