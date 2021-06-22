import 'package:club_house/src/models/Notification.dart' as Notif;
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifPage extends StatelessWidget {
  List<Notif.Notification> notif;

  @override
  Widget build(BuildContext context) {
    notif = Get.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text("notification".tr),
                  ),
                ),
                SizedBox(
                  width: 64.0,
                )
              ],
            ),
          ),
        ),
        body: _notifListBuilder(notif));
  }

  Widget _notifListBuilder(List<Notif.Notification> notifs) {
    return ListView.builder(
      itemCount: notifs.length,
      itemBuilder: (bc, index) {
        return _notificationBuilder(notifs[index]);
      },
    );
  }

  Widget _notificationBuilder(Notif.Notification notif) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundImage(
            url: notif.user_profile.photo_url ?? "",
          ),
          Expanded(
            child: Container(
                constraints: BoxConstraints(minHeight: 60),
                padding: EdgeInsets.all(7.0),
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                ),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Wrap(
                    children: [
                      Text(
                        notif.user_profile.username + " ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(notif.message)
                    ],
                  ),
                )),
          ),
          Text(
            notif.getCreateTime(),
            style: TextStyle(
              fontSize: 9,
              color: Get.theme.textTheme.bodyText2.color.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
