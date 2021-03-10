// responsible to save any tiny data in application
import 'package:shared_preferences/shared_preferences.dart';

class Valutor {
  SharedPreferences _pref;

  Valutor(this._pref);

  /*Keys*/
  final TOKEN_KEY = "token";

  /*Values*/
  String _token;

  String get token => _token = _pref.getString(TOKEN_KEY);

  set token(String token) {
    _token = token;
    _pref.setString(TOKEN_KEY, token);
  }
}
