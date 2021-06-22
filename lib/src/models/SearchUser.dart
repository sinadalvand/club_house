import 'package:club_house/src/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SearchUser.g.dart';

@JsonSerializable()
class SearchUser {
  int count;
  List<FullUser> users;

  SearchUser(this.count, this.users);

  factory SearchUser.fromJson(Map<String, dynamic> json) => _$SearchUserFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUserToJson(this);
}

