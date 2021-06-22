import 'package:club_house/src/models/ClubRule.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Club.g.dart';

@JsonSerializable()
class Club {

   var club_id;
   String description;
   bool is_follow_allowed;
   bool is_membership_private;
   String name;
   int num_followers;
   int num_members;
   String photo_url;
   List<ClubRule> rules;
   String url;

   Club(this.club_id, this.description,this.is_follow_allowed,this.is_membership_private
       ,this.name,this.num_followers,this.num_members,this.photo_url,this.rules,this.url);

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);

  Map<String, dynamic> toJson() => _$ClubToJson(this);
}

