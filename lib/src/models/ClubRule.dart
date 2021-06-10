import 'package:club_house/src/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ClubRule.g.dart';

@JsonSerializable()
class ClubRule {
  String desc;
  String title;

  ClubRule(this.desc, this.title);

  factory ClubRule.fromJson(Map<String, dynamic> json) => _$ClubRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ClubRuleToJson(this);
}

