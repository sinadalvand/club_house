import 'package:club_house/main.dart';
import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/models/Notification.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/repository/BroadcastRepository.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPageController extends Controller {
  BroadcastRepository _broadcastRepository = Get.find();
  ProfileRepository _profileRepository = Get.find();

  RefreshController refreshController = RefreshController(initialRefresh: false);

  // user channel after fetch
  List<Channel> channels = [];

  // first page of user notification
  List<Notification> notifications = [];

  // user notif event
  List<Notification> events = [];

  // current ser profile
  FullUser profile;

  var UnreadNotifCounter = 0;

  @override
  void onInit() {
    _requestInitData();
  }

  _requestInitData() {
    _profileRepository.getProfile(valutor.user_id).asStream().asyncMap((event) {
      profile = event;
      return _broadcastRepository.getChannels();
    }).asyncMap((event) {
      channels = event;
      return _broadcastRepository.getNotifications();
    }).handleError((onError) {
      logger.e(onError);
    }).listen((event) {
      notifications = event.notifications;
      UnreadNotifCounter = 0;
      notifications.forEach((element) {
        if (element.is_unread) UnreadNotifCounter++;
        if(element.is_event()) events.add(element);
      });
      update();
    });
  }

}
