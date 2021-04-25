import 'dart:io';

import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/repository/ProfileRepository.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:get/get.dart';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';

class ProfilePicturePickerController extends Controller {
  final _profileRepository = Get.find<ProfileRepository>();

  Function onNextButtonClick;

  File image;

  setSelectedPicture(File image) {
    _clipAndResizeImage(image).then((value) {
      this.image = value;
      if (image != null) this.onNextButtonClick = _requestToUploadImage;
      update();
    });
  }

  _requestToUploadImage() {
    _profileRepository.updateProPic(this.image).then((value) {
      if (value.success) {
        Get.offNamed(Director.MAIN_PAGE.route);
      } else {
        //TODO handle error
      }
    });
  }

  Future<File> _clipAndResizeImage(File imageFile) async {
    final desireSize = 512;
    Image image = decodeImage(imageFile.readAsBytesSync());
    Image thumbnail = copyResize(image, width: desireSize, height: desireSize, interpolation: Interpolation.cubic);
    var changedSize = encodePng(thumbnail);
    Directory tempDir = await getTemporaryDirectory();
    final export = File(tempDir.path + '/profile_image.png')..writeAsBytesSync(changedSize);
    return Future.value(export);
  }
}
