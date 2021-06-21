import 'package:club_house/src/controller/InvitePageController.dart';
import 'package:club_house/src/view/common/widget/register_next_button.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvitePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvitePageController>(
      init: Get.find(),
      builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text("invite".tr),
                  ),
                ),
                SizedBox(
                  width: 64.0,
                )
              ],
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text("invite_description".tr.trParams({"count": "5"}),
                  textAlign: TextAlign.center),
              SizedBox(height: 10),
              buildForm(controller),
              SizedBox(height: 10),
              RegisterNextButton(" " + "send".tr + " ", () {
                controller.submit();
              }, 100),
              SizedBox(height: 20),
              _requestStatus(controller),
              SizedBox(height: 20),
              Expanded(child: Center()),
              Text("anonymous_inv".tr),
              Text(
                "anonymous_inv_desc".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Get.theme.textTheme.bodyText2.color.withOpacity(0.4),
                    fontSize: 9),
              ),
              _invitationRandom(),
              SizedBox(height: 50),
            ],
          ),
        ),
      );
    },);
  }

  Widget buildForm(InvitePageController controller) {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
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
                controller.countryCode = value.dialCode;
              },
              onInit: (value) {
                controller.countryCode = value.dialCode;
              },
            ),
            Expanded(
              child: Form(
                key: controller.formKey,
                child: TextFormField(
                  onChanged: (value) {
                    controller.phone = value;
                  },
                  controller: controller.phoneInputController,
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
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _invitationRandom() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (cl, index) {
          return _invitationRequestItem();
        },
      ),
    );
  }

  Widget _invitationRequestItem() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(7.0),
          ),
          width: 120,
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              RoundImage(
                width: 50,
                height: 50,
                path: "assets/images/propic.jpg",
              ),
              SizedBox(height: 10),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  "******9897",
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Center(
                child: Text("send".tr),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _requestStatus(controller){
    return Container(height: 20,child:Text(controller.status),);
  }
}
