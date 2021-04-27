import 'package:club_house/src/controller/MainPageController.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/homepage/home_app_bar.dart';
import 'package:club_house/src/view/homepage/lobby_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      init: Get.find(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: HomeAppBar(
              profile: controller.profile,
              onProfileTab: () => Get.toNamed(Director.PROFILE.route),
            ),
          ),
          body: LobbyPage(controller),
        );
      },
    );
  }
}
