import 'package:badges/badges.dart';
import 'package:club_house/src/controller/MainPageController.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/utils/data.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  final FullUser profile;
  final Function onProfileTab;

  const HomeAppBar({Key key, this.profile, this.onProfileTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: Icon(Icons.search),
          ),
        ),
        Spacer(),
        Row(
          children: [
            // IconButton(
            //   onPressed: () {},
            //   iconSize: 30,
            //   icon: Icon(Icons.mail),
            // ),
            // SizedBox(
            //   width: 10,
            // ),
            // IconButton(
            //   onPressed: () {},
            //   iconSize: 30,
            //   icon: Icon(Icons.calendar_today),
            // ),
            SizedBox(
              width: 10,
            ),
            _notificationBudgetCreator(),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: onProfileTab,
              child: Hero(
                tag: 'profile_picture',
                child: RoundImage(
                  url: profile.photo_url ?? "",
                  width: 40,
                  height: 40,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _notificationBudgetCreator() {
    final unreadNotif = Get.find<MainPageController>().UnreadNotifCounter;
    if (unreadNotif > 0)
      return Badge(
        position: BadgePosition.topStart(top: 5, start: 5),
        badgeContent: Text(
          unreadNotif.toString(),
          style: TextStyle(fontSize: 10),
        ),
        toAnimate: true,
        child: IconButton(
          onPressed: () {},
          iconSize: 30,
          icon: Icon(Icons.notifications_active_outlined),
        ),
      );
    else
      return IconButton(
        onPressed: () {},
        iconSize: 30,
        icon: Icon(Icons.notifications_active_outlined),
      );
  }
}
