import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/routes.dart';
import 'common/widget/round_button.dart';
import '../controller/WelcomePageController.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GetBuilder<WelcomePageController>(
      init: WelcomePageController(), // INIT IT ONLY THE FIRST TIME
      builder: (_) {
        // show unofficial dialog just once
        ever(_.showUnofficialDialog,(show)=>{if(show)_showUnofficialDialog(context,()=>{_.hideDialog()})});
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
              bottom: 60,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTitle(),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: buildContents(),
                ),
                buildBottom(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTitle() {
    return Text(
      'welcome'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildContents() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'working_hard'.tr,
            textAlign: TextAlign.justify,
            style: TextStyle(
              height: 1.8,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'you_should_invite'.tr,
            style: TextStyle(
              height: 1.8,
              fontSize: 15,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'team_creator'.tr,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RoundButton(
          color: Get.theme.accentColor,
          onPressed: () => Get.toNamed(Director.SIGN_IN.route),
          child: Container(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'got_username'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Director.SIGN_IN.route),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'have_invite'.tr,
                style: TextStyle(
                  color: Get.theme.accentColor,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'sin_in'.tr,
                style: TextStyle(
                  color: Get.theme.accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _showUnofficialDialog(context,Function dismiss) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      dialogBackgroundColor: Get.theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Center(
              child: Text(
                "warning".tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Center(
              child: Text(
                "unofficial_description".tr,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
      headerAnimationLoop: false,
      btnOkText: "ok".tr,
      btnOkOnPress: () {},
      onDissmissCallback:dismiss,
    ).show();
  }
}
