import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  FullUser profile;

  @override
  Widget build(BuildContext context) {
    profile = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings_rounded),
            onPressed: () {},
          ),
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
            RoundImage(
              url: profile.photo_url,
              width: 100,
              height: 100,
              borderRadius: 35,
            ),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' followers'),
                    ],
                    style: TextStyle(
                      color: Colors.black,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' following'),
                    ],
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            dummyText,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget builderInviter() {
    return Row(
      children: [
        RoundImage(
          url: profile.invited_by_user_profile.photo_url,
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
                    ),
                  ),
                ],
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
