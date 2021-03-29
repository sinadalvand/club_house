// responsible to save any tiny data in application
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Valutor {
  GetStorage _pref = Get.find();



  final IS_WAITEDLIST_KEY = "is_waitedlist";
  String _waitedlist;
  bool get waitedlist => _waitedlist= _pref.read(IS_WAITEDLIST_KEY)??false;
  set waitedlist(bool is_waitedlist) => _pref.write(IS_WAITEDLIST_KEY, is_waitedlist);


  final USER_ID_KEY = "user_id";
  String _user_id;
  String get user_id => _user_id= _pref.read(USER_ID_KEY);
  set user_id(String user_id) => _pref.write(USER_ID_KEY, user_id);


  final TOKEN_KEY = "token";
  String _token;
  String get token => _token = _pref.read(TOKEN_KEY);
  set token(String token) {
    _token = token;
    _pref.write(TOKEN_KEY, token);
  }


  final UNOFFICAL_WARNING_KEY = "unofficial_warning";
  bool _unofficial_warning;
  bool get unofficial_warning_show => _pref.read(UNOFFICAL_WARNING_KEY) ?? true;
  set unofficial_warning_show(bool show) => _pref.write(UNOFFICAL_WARNING_KEY, show);
}
