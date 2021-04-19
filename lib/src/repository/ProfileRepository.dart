import 'dart:io';

import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/BaseResponse.dart';

class ProfileRepository extends Repository {

  Future<BaseResponse> updateName(String name) => api.updateName(name);

  Future<BaseResponse> updateUserName(String username) => api.updateUserName(username);

  Future<BaseResponse> updateProPic(File file) => api.updatePropic(file);
}
