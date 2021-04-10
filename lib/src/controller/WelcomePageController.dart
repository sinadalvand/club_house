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

  // if token != null & witelist != true & profile.name != null && profile.username != null go to main page
  initCheck() {
    var tokenExistance = valutor.token != null;
    var isWaitlist = valutor.waitedlist;
    var hasUsername = valutor.username != null;
    var hasName = valutor.name != null;

    if (!tokenExistance) {
      // do nothing and break stream check
    } else if (hasName) {
      navigator.value = Director.REGISTER_NAME;
    } else if (hasUsername) {
      navigator.value = Director.REGISTER_USERNAME;
    } else if (isWaitlist && tokenExistance) {
      navigator.value = Director.WAIT_LIST;
    } else {
      navigator.value = Director.MAIN_PAGE;
    }
  }
}
