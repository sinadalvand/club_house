import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/widget/register_next_button.dart';

class UsernamePage extends StatelessWidget {
  final _userNameController = TextEditingController();
  final _userNameformKey = GlobalKey<FormState>();
  Function onNextButtonClick;

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
        child: Column(
          children: [
            buildTitle(),
            SizedBox(
              height: 50,
            ),
            buildForm(),
            Spacer(),
            buildBottom(),
          ],
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

  Widget buildForm() {
    return Container(
      width: 330,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Form(
          key: _userNameformKey,
          child: Directionality(textDirection: TextDirection.ltr, child: TextFormField(
            textAlign: TextAlign.center,
            onChanged: (value) {
              _userNameformKey.currentState.validate();
            },
            // validator: (value) {
            //   if (value.isEmpty) {
            //     setState(() {
            //       onNextButtonClick = null;
            //     });
            //   } else {
            //     setState(() {
            //       // onNextButtonClick = next;
            //     });
            //   }
            //   return null;
            // },
            controller: _userNameController,
            autocorrect: false,
            autofocus: false,
            decoration: InputDecoration(
              hintText: '@username',
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
          ),)
      ),
    );
  }

  Widget buildBottom() {
    return RegisterNextButton("next".tr);
  }
}
