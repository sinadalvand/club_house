import 'package:club_house/main.dart';
import 'package:club_house/src/controller/PhoneVerifyController.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../common/widget/round_button.dart';

class PhoneNumberVerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // go to next page
    ever(Get.find<PhoneVerifyController>().director, (director) => _gotoNextPage(director));

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 60,
        ),
        child: Column(
          children: [
            buildTitle(),
            SizedBox(
              height: 10,
            ),
            buildForm(),
            SizedBox(
              height: 10,
            ),
            buildResend(),
            Spacer(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget boxedPinPutWithPreFilledSymbol() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
    );
    return Container(
      child: PinPut(
        withCursor: true,
        fieldsCount: 4,
        textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
        eachFieldWidth: 50.0,
        eachFieldHeight: 50.0,
        onSubmit: (String pin) {
          logger.d("pin: " + pin);
        },
        onChanged: (code) => Get.find<PhoneVerifyController>().setEnterCode(code),
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration.copyWith(color: Colors.white),
        followingFieldDecoration: pinPutDecoration,
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'enter_sent_code'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              child: boxedPinPutWithPreFilledSymbol(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildResend() {
    return GestureDetector(
      onTap: () {
        var controller = Get.find<PhoneVerifyController>();
        if (controller.counter.value == 0) controller.resendCode();
      },
      child: Obx(
        () {
          final controller = Get.find<PhoneVerifyController>();
          final counter = controller.counter.toString();
          final resendCount = controller.resendCount;

          return AnimatedOpacity(
              opacity: counter == "0" ? 1.0 : 0.4,
              duration: Duration(seconds: 1),
              child: resendCount > 2 ? _makePhoneCallCounter() : _resendButtonContent(counter));
        },
      ),
    );
  }

  Widget _makePhoneCallCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'make_phone_call'.tr,
        ),
      ],
    );
  }

  // show resend text
  Widget _resendButtonContent(counter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'did_not_receive_it'.tr,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          counter != "0" ? counter : 'tap_to_resend'.tr,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildBottom() {
    return Column(
      children: [
        GetBuilder<PhoneVerifyController>(
          init: Get.find(),
          builder: (controller) {
            return RoundButton(
              color: Get.theme.accentColor,
              minimumWidth: 230,
              disabledColor: Get.theme.accentColor.withOpacity(0.3),
              onPressed: controller.nextButtonFunction,
              child: Container(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'next'.tr,
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
            );
          },
        )
      ],
    );
  }

  _gotoNextPage(Director director) {
    Get.offNamed(director.route);
  }
}
