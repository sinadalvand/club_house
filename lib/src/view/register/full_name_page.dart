import 'package:club_house/src/controller/FullnamePageController.dart';
import 'package:club_house/src/view/common/widget/register_next_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widget/round_button.dart';

class FullNamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30, bottom: 60),
        child: GetBuilder<FullNamePageController>(
          init: Get.find(),
          builder: (controller) {
            return Column(
              children: [
                buildTitle(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: buildForm(controller),
                ),
                Spacer(),
                buildBottom(controller),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'what_is_your_full_name'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm(FullNamePageController controller) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: controller.firstNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  controller.firstNameFormKey.currentState.validate();
                },
                validator: (value) {
                  controller.setFirstName(value);
                  return null;
                },
                controller: controller.firstNameController,
                autocorrect: false,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'firstname'.tr,
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: controller.lastNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) =>controller.lastNameFormKey.currentState.validate(),
                validator: (value) {
                  controller.setLastName(value);
                  return null;
                },
                controller: controller.lastNameController,
                autocorrect: false,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'lastname'.tr,
                  hintStyle: TextStyle(
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildBottom(FullNamePageController controller) {
    return RegisterNextButton("next".tr,controller.onNextButtonClick);
  }
}
