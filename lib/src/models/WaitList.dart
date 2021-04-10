import 'package:json_annotation/json_annotation.dart';

part 'WaitList.g.dart';

@JsonSerializable()
class WaitList {

  bool is_waitlisted;
  bool is_onboarding;

  WaitList(this.is_waitlisted, this.is_onboarding);

  factory WaitList.fromJson(Map<String, dynamic> json) => _$WaitListFromJson(json);

  Map<String, dynamic> toJson() => _$WaitListToJson(this);
}
