import 'package:club_house/src/models/Club.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SearchClub.g.dart';

@JsonSerializable()
class SearchClub {
  int count;
  List<Club> clubs;

  SearchClub(this.count, this.clubs);

  factory SearchClub.fromJson(Map<String, dynamic> json) => _$SearchClubFromJson(json);

  Map<String, dynamic> toJson() => _$SearchClubToJson(this);
}

