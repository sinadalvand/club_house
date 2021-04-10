import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/widget/round_button.dart';


class FullNamePage extends StatelessWidget {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _firstNameFormKey = GlobalKey<FormState>();
  final _lastNameFormKey = GlobalKey<FormState>();
  Function onNextButtonClick;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 30, bottom: 60),
        child: Column(
          children: [
            buildTitle(),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: buildForm(),
            ),
            Spacer(),
            buildBottom(),
          ],
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

  Widget buildForm() {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Form(
              key: _firstNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _firstNameFormKey.currentState.validate();
                },
                // validator: (value) {
                //   if (value.isNotEmpty) {
                //     if (_lastNameController.text.isNotEmpty) {
                //       setState(() {
                //         onNextButtonClick = next;
                //       });
                //     }
                //   } else {
                //     setState(() {
                //       onNextButtonClick = null;
                //     });
                //   }
                //
                //   return null;
                // },
                controller: _firstNameController,
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
              key: _lastNameFormKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _lastNameFormKey.currentState.validate();
                },
                // validator: (value) {
                //   if (value.isNotEmpty) {
                //     if (_firstNameController.text.isNotEmpty) {
                //       setState(() {
                //         onNextButtonClick = next;
                //       });
                //     }
                //   } else {
                //     setState(() {
                //       onNextButtonClick = null;
                //     });
                //   }
                //
                //   return null;
                // },
                controller: _lastNameController,
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

  Widget buildBottom() {
    return RoundButton(
      color: Get.theme.accentColor,
      minimumWidth: 230,
      disabledColor: Get.theme.accentColor.withOpacity(0.3),
      onPressed: onNextButtonClick,
      child: Container(
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
    );
  }
}
