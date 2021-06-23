import 'package:club_house/src/view/common/widget/register_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../common/routes.dart';

class WaitListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          bottom: 60,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTitle(),
            SizedBox(
              height: 30,
            ),
            buildBottom(context),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Center(
                child: _suggestionBox(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'we_have_reserved'.trParams({'name': ''}),
          textAlign: TextAlign.center,
          style: TextStyle(
            height: 1.8,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget buildBottom(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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

  Widget _suggestionBox() {
    return Container(
      padding: EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Colors.white12.withOpacity(0.05),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
      height: 130,
      width: 280,
      child: Column(
        children: [
          Text(
            "auto_invite_desc".tr,
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          SizedBox(
            height: 10,
          ),
          RegisterNextButton("request".tr)
        ],
      ),
    );
  }
}
