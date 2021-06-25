import 'package:club_house/src/controller/PhonePageController.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widget/round_button.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true,),
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
              height: 50,
            ),
            buildForm(),
            buildBlockError(),
            buildBottom(),
          ],
        ),
      ),
    );
  }

  Widget buildBlockError() {
    return GetBuilder<PhonePageController>(
        init: Get.find(),
        builder: (_) {
          return _.phoneBlocked
              ? Expanded(
                  child: Center(
                    child: Text(
                      'you_have_been_blocked'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                )
              : Spacer();
        });
  }

  Widget buildTitle() {
    return Text(
      'enter_phone'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: GetBuilder<PhonePageController>(
          init: Get.find(),
          builder: (phoneController) {
            return Row(
              children: [
                CountryCodePicker(
                  initialSelection: 'IR',
                  showCountryOnly: false,
                  alignLeft: false,
                  dialogBackgroundColor: Get.theme.scaffoldBackgroundColor,
                  padding: const EdgeInsets.all(8),
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  onChanged: (value) {
                    phoneController.countryCode = value.dialCode;
                  },
                  onInit: (value) {
                    phoneController.countryCode = value.dialCode;
                  },
                ),
                Expanded(
                  child: Form(
                    key: phoneController.formKey,
                    child: TextFormField(
                      onChanged: (value) {
                        phoneController.formKey.currentState.validate();
                      },
                      validator: (value) {
                        phoneController.enableNextButton(value.isEmpty ? null : goNext);
                        return null;
                      },
                      controller: phoneController.phoneNumberController,
                      autocorrect: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'phone_number'.tr,
                        hintStyle: TextStyle(
                          fontSize: 20,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildBottom() {
    return Column(
      children: [
        Text(
          'accept_terms'.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        GetBuilder<PhonePageController>(
          init: Get.find(),
          builder: (phoneController) {
            return RoundButton(
              color: Get.theme.accentColor,
              minimumWidth: 230,
              disabledColor: Get.theme.accentColor.withOpacity(0.3),
              onPressed: phoneController.onSignUpButtonClick,
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
        ),
      ],
    );
  }

  goNext() {
    Get.find<PhonePageController>().requestSendCode();
  }
}
