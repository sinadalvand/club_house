
import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/BaseResponse.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/models/Notification.dart';

class BroadcastRepository extends Repository{

  Future<List<Channel>> getChannels() => api.getChannels().asStream().map((event) => event.channels).first;

  Future<NotificationResponse> getNotifications() => api.getNotifications(valutor.user_id, 1);

  Future<BaseResponse> getEvents(String event) => api.getEvents(event);

}