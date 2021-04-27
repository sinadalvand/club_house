import 'package:club_house/src/contracts/controller.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:get/get.dart';

class WelcomePageController extends Controller {
  var showUnofficialDialog = false.obs;

  var navigator = Rx<Director>();

  @override
  void onReady() {
    showUnofficialDialog.value = valutor.unofficial_warning_show;
  }

  // save value to prevent show twice unofficial dialog
  hideDialog() {
    showUnofficialDialog.value = valutor.unofficial_warning_show = false;
  }

}
