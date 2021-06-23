import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:club_house/src/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoomProfile extends StatelessWidget {
  final FullUser user;
  final double size;
  final bool isMute;
  final bool isModerator;

  const RoomProfile(
      {Key key,
      this.user,
      this.size,
      this.isMute = false,
      this.isModerator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () =>Get.toNamed(
                Director.PROFILE.route,
                arguments: user,
              ),
              child: RoundImage(
                path: user.photo_url,
                width: size,
                height: size,
              ),
            ),
            buildNewBadge(true),
            buildMuteBadge(isMute),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildModeratorBadge(isModerator),
            Text(
              user.name.split(' ')[0],
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildModeratorBadge(bool isModerator) {
    return isModerator
        ? Container(
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              // color: Style.AccentGreen,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              Icons.star,
              color: Colors.white,
              size: 12,
            ),
          )
        : Container();
  }

  Widget buildMuteBadge(bool isMute) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: isMute
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Icon(Icons.mic_off),
            )
          : Container(),
    );
  }

  Widget buildNewBadge(bool isNewUser) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: isNewUser
          ? Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 1),
                  )
                ],
              ),
              child: Text(
                '🎉',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          : Container(),
    );
  }
}
