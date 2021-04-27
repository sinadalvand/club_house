import 'package:club_house/src/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Followers.g.dart';

@JsonSerializable()
class Followers{
   List<FullUser> users;
   int count;

   Followers(this.users,this.count);

   factory Followers.fromJson(Map<String, dynamic> json) => _$FollowersFromJson(json);

   Map<String, dynamic> toJson() => _$FollowersToJson(this);
}


@JsonSerializable()
class Following{

  List<FullUser> users;
  int count;

  Following(this.users,this.count);

  factory Following.fromJson(Map<String, dynamic> json) => _$FollowingFromJson(json);

  Map<String, dynamic> toJson() => _$FollowingToJson(this);
}


