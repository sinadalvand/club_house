import 'package:json_annotation/json_annotation.dart';

part 'BaseResponse.g.dart';

@JsonSerializable()
class BaseResponse{
  bool success;
  String error_message;

  BaseResponse(this.success, this.error_message);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}