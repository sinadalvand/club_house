import 'package:club_house/src/models/User.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Notification.g.dart';

@JsonSerializable()
class Notification {
  int notificationId;
  bool in_unread;
  //TODO active this part after create it
  User user_profile;
  int event_id;
  int type;
  DateTime time_created;
  String message;

  Notification(this.notificationId, this.in_unread,this.event_id,this.type,this.time_created,this.message);

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);
}

@JsonSerializable()
class NotificationResponse{

  int count;

  List<Notification> notifications;

  NotificationResponse(this.count, this.notifications);

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}