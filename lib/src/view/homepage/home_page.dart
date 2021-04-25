import 'package:club_house/src/utils/data.dart';
import 'package:club_house/src/view/homepage/home_app_bar.dart';
import 'package:club_house/src/view/homepage/lobby_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBar(
          profile: myProfile,
          onProfileTab: () {
            //TODO go to profile
          },
        ),
      ),
      body:LobbyPage()
      //   PageView(
      //   children: [
      //     LobbyPage(),
      //     FollowerPage(),
      //   ],
      // ),
    );
  }
}
