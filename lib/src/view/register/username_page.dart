import 'package:club_house/src/controller/UsernamePageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/widget/register_next_button.dart';

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 60,
        ),
        child: GetBuilder<UsernamePageController>(
          init: Get.find<UsernamePageController>(),
          builder: (controller) => Column(
            children: [
              buildTitle(),
              SizedBox(
                height: 50,
              ),
              buildForm(controller),
              Spacer(),
              buildBottom(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'pick_username'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm(UsernamePageController controller) {
    return Container(
      width: 330,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "@",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: 48, maxWidth: 300),
              child: IntrinsicWidth(
                child: TextField(
                  autocorrect: false,
                  autofocus: false,
                  decoration: InputDecoration.collapsed(
                    hintText: 'username',
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) => controller.setUsername(value),
                  controller: controller.userNameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    fontSize: 20,
                    decoration: null,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottom(UsernamePageController controller) {
    return RegisterNextButton("check_and_go".tr, controller.onNextButtonClick);
  }
}
