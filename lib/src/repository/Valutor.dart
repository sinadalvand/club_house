// responsible to save any tiny data in application
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Valutor {
  GetStorage _pref = Get.find();



  final IS_WAITEDLIST_KEY = "is_waitedlist";
  bool get waitedlist => _pref.read(IS_WAITEDLIST_KEY)??false;
  set waitedlist(bool is_waitedlist) => _pref.write(IS_WAITEDLIST_KEY, is_waitedlist);


  final USER_ID_KEY = "user_id";
  String get user_id =>  _pref.read(USER_ID_KEY);
  set user_id(String user_id) => _pref.write(USER_ID_KEY, user_id);


  final TOKEN_KEY = "token";
  String get token => _pref.read(TOKEN_KEY);
  set token(String token) {
    _pref.write(TOKEN_KEY, token);
  }

  final UNOFFICAL_WARNING_KEY = "unofficial_warning";
  bool get unofficial_warning_show => _pref.read(UNOFFICAL_WARNING_KEY) ?? true;
  set unofficial_warning_show(bool show) => _pref.write(UNOFFICAL_WARNING_KEY, show);


  // user name after login
  final NAME_KEY = "name";
  String get name => _pref.read(NAME_KEY);
  set name(String name) => _pref.write(NAME_KEY, name);


  // username
  final USER_NAME_KEY = "username";
  String get username => _pref.read(USER_NAME_KEY);
  set username(String username) => _pref.write(USER_NAME_KEY, username);

}
