import 'package:json_annotation/json_annotation.dart';

part 'SendSms.g.dart';

@JsonSerializable()
class SendSms {
  bool success;
  String error_message;
  bool is_blocked;

  SendSms(this.success, this.is_blocked, this.error_message);

  factory SendSms.fromJson(Map<String, dynamic> json) => _$SendSmsFromJson(json);

  Map<String, dynamic> toJson() => _$SendSmsToJson(this);
}
