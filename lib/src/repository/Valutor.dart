// responsible to save any tiny data in application
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Valutor {
  GetStorage _pref = Get.find();

  /*Keys*/
  final TOKEN_KEY = "token";
  final UNOFFICAL_WARNING_KEY = "unofficial_warning";

  /*Values*/
  String _token;
  bool _unofficial_warning;

  String get token => _token = _pref.read(TOKEN_KEY);

  set token(String token) {
    _token = token;
    _pref.write(TOKEN_KEY, token);
  }

  bool get unofficial_warning_show => _pref.read(UNOFFICAL_WARNING_KEY) ?? true;

  set unofficial_warning_show(bool show) => _pref.write(UNOFFICAL_WARNING_KEY, show);
}
