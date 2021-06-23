import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  FullUser profile;

  @override
  Widget build(BuildContext context) {
    profile = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //   icon: Icon(Icons.settings_rounded),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            buildProfile(),
            SizedBox(
              height: 20,
            ),
            builderInviter(),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
                tag: "profile_picture",
                child: RoundImage(
                  url: profile.photo_url,
                  width: 100,
                  height: 100,
                  borderRadius: 35,
                )),
            SizedBox(
              height: 20,
            ),
            Text(
              profile.name,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                '@' + profile.username,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: profile.num_followers.toString(),
                        style: TextStyle(
                          color: Get.theme.textTheme.bodyText2.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'followers'.tr),
                    ],
                    style: TextStyle(
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: profile.num_following.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          color: Get.theme.textTheme.bodyText2.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'followings'.tr),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            profile.bio ?? "",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget builderInviter() {
    if(profile.invited_by_user_profile!=null)
    return Row(
      children: [
        RoundImage(
          url: profile.invited_by_user_profile.photo_url??"",
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('joined'.trParams({'date': profile.getJoinTime()})),
            SizedBox(
              height: 3,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'nominated_by'.tr,
                  ),
                  TextSpan(
                    text: profile.invited_by_user_profile.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.textTheme.bodyText2.color.withOpacity(0.7),
                    ),
                  ),
                ],
                style: TextStyle(
                  color: Get.theme.textTheme.bodyText2.color.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ],
    );
    else
    return Center();
  }
}
