import 'package:club_house/src/repository/Valutor.dart';
import 'package:uuid/uuid.dart';

class Session {
  Valutor _val;

  Session(this._val);

  String deviceId;

  load() {
    deviceId = _checkUUidExistence();
  }

  // check old Id exist , if not then create newone
  String _checkUUidExistence() {
    var temp_token = _val.device_id;
    return temp_token == null ? (_val.device_id = _generateUUID()) : temp_token;
  }

  // generate unique ID for every device
  String _generateUUID() {
    Uuid uuid = Uuid();
    return uuid.v4();
  }
}
