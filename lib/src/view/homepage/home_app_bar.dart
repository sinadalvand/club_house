import 'package:badges/badges.dart';
import 'package:club_house/main.dart';
import 'package:club_house/src/controller/MainPageController.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/utils/data.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeAppBar extends StatelessWidget {
  final FullUser profile;
  final Function onProfileTab;

  const HomeAppBar({Key key, this.profile, this.onProfileTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: IconButton(
            onPressed: () {
              Get.toNamed(Director.SEARCH.route);
            },
            iconSize: 30,
            icon: Icon(Icons.search),
          ),
        ),
        Spacer(),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Get.toNamed(Director.INVITE.route);
              },
              iconSize: 30,
              icon: Icon(Icons.mail),
            ),
            SizedBox(
              width: 10,
            ),
            _notificationBudgetCreator(),
            SizedBox(
              width: 10,
            ),
            if (profile == null)
              _loadingToolbar()
            else
              _loadedToolbar(profile.photo_url)
          ],
        ),
      ],
    );
  }

  Widget _loadingToolbar() {
    return Shimmer.fromColors(
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
      ),
      baseColor: Colors.black12,
      highlightColor: Colors.white24,
      direction: ShimmerDirection.ttb,
    );
  }

  Widget _loadedToolbar(url) {
    return GestureDetector(
      onTap: onProfileTab,
      child: Hero(
        tag: 'profile_picture',
        child: RoundImage(
          url: url ?? "",
          width: 40,
          height: 40,
        ),
      ),
    );
  }


  Widget _notificationBudgetCreator() {
    final unreadNotif = Get.find<MainPageController>();
    if (unreadNotif.UnreadNotifCounter > 0)
      return Badge(
        position: BadgePosition.topStart(top: 5, start: 5),
        badgeContent: Text(
          unreadNotif.UnreadNotifCounter.toString(),
          style: TextStyle(fontSize: 10),
        ),
        toAnimate: true,
        child: IconButton(
          onPressed: () {
            Get.toNamed(
              Director.NOTIFICATION.route,
              arguments: unreadNotif.notifications
            );
          },
          iconSize: 30,
          icon: Icon(Icons.notifications_active_outlined),
        ),
      );
    else
      return IconButton(
        onPressed: () {
          Get.toNamed(
            Director.NOTIFICATION.route,
              arguments: unreadNotif.notifications
          );
        },
        iconSize: 30,
        icon: Icon(Icons.notifications_active_outlined),
      );
  }
}
