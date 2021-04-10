import 'package:flutter/material.dart';
import 'common/widget/register_next_button.dart';
import 'package:get/get.dart';

class PickPhotoPage extends StatelessWidget {
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
            Spacer(
              flex: 1,
            ),
            buildContents(),
            Spacer(
              flex: 3,
            ),
            buildBottom(),
            Spacer(
              flex: 1,
            ),
            buildSkip(context)
          ],
        ),
      ),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'skip'.tr,
          style: TextStyle(
            color: Get.theme.accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Text(
      'add_new_picture'.tr,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  Widget buildContents() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(80),
      ),
      child: Icon(
        Icons.add_photo_alternate_outlined,
        size: 100,
        color: Get.theme.accentColor,
      ),
    );
  }

  Widget buildSkip(context) {
    return buildActionButton(context);
  }

  Widget buildBottom() {
    return RegisterNextButton("next".tr);
  }
}
