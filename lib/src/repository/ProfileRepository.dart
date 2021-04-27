import 'dart:io';

import 'package:club_house/src/contracts/repository.dart';
import 'package:club_house/src/models/BaseResponse.dart';
import 'package:club_house/src/models/Followers.dart';
import 'package:club_house/src/models/User.dart';

class ProfileRepository extends Repository {

  Future<FullUser> getProfile(int userId) => api.getProfile(userId).asStream().map((event) => event.user_profile).first;

  Future<BaseResponse> updateName(String name) => api.updateName(name);

  Future<BaseResponse> follow(int userId) => api.followUser(userId);

  Future<BaseResponse> unfollow(int userId) => api.unfollowUser(userId);

  Future<BaseResponse> inviteUser(String phone) => api.inviteUserToApp(phone);

  Future<BaseResponse> updateUserName(String username) => api.updateUserName(username);

  Future<BaseResponse> updateProPic(File file) => api.updatePropic(file);

  Future<BaseResponse> updateBio(String bio) => api.updateBio(bio);

  Future<Followers> getFollowers(int userId,int page) => api.getFollowers(userId,page);

  Future<Following> getFollowing(int userId,int page) => api.getFollowing(userId,page);


}
