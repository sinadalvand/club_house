import 'dart:io';

import 'package:club_house/src/view/common/routes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../common/widget/register_next_button.dart';
import 'package:get/get.dart';
import 'package:club_house/src/controller/ProfilePicturePickerController.dart';

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
          child: GetBuilder<ProfilePicturePickerController>(
            init: Get.find<ProfilePicturePickerController>(),
            builder: (controller) => Column(
              children: [
                buildTitle(),
                Spacer(
                  flex: 1,
                ),
                buildContents(controller),
                Spacer(
                  flex: 3,
                ),
                buildBottom(controller),
                Spacer(
                  flex: 1,
                ),
                buildSkip(context)
              ],
            ),
          )),
    );
  }

  Widget buildActionButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GestureDetector(
        onTap: ()=> Get.offAndToNamed(Director.MAIN_PAGE.route),
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

  _showPicker() {
    _pickImage();
  }

  _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      Get.find<ProfilePicturePickerController>().setSelectedPicture(file);
    }
  }

  _imagePreview(File file) {
    if (file != null)
      return ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.file(file),
      );
    else
      return Icon(
        Icons.add_photo_alternate_outlined,
        size: 100,
        color: Get.theme.accentColor,
      );
  }

  Widget buildContents(ProfilePicturePickerController controller) {
    return GestureDetector(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(80),
          ),
          child: _imagePreview(controller.image),
        ),
        onTap: _showPicker);
  }

  Widget buildSkip(context) {
    return buildActionButton(context);
  }

  Widget buildBottom(ProfilePicturePickerController controller) {
    return RegisterNextButton("next".tr,controller.onNextButtonClick);
  }
}
