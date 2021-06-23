import 'package:club_house/src/controller/SearchPageController.dart';
import 'package:club_house/src/models/Club.dart';
import 'package:club_house/src/models/User.dart';
import 'package:club_house/src/view/common/routes.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      init: Get.find(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text("search".tr),
                    ),
                  ),
                  SizedBox(
                    width: 64.0,
                  )
                ],
              ),
            ),
          ),
          body: Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        child: Text(
                          "cancel".tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onTap: () => Get.back(),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        child: _searchBox(controller),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  flex: 4,
                  child: _usersList(controller.users),
                ),
                Expanded(
                  flex: 18,
                  child: _roomsList(controller.channels),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _searchBox(SearchPageController controller) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _searchingMode(),
        Expanded(
          child: Container(
            child: TextField(
              key: controller.formKey,
              controller: controller.searchInputController,
              onChanged: (text) {
                controller.find(text);
              },
              autofocus: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "search_user_and_room".tr),
            ),
          ),
        ),
      ],
    );
  }

  Widget _searchingMode({bool isSearching = false}) {
    return IconButton(
      onPressed: () {},
      iconSize: 30,
      color: Colors.black,
      icon: isSearching
          ? SpinKitCircle(
        size: 30,
        color: Colors.black12,
      )
          : Icon(
        Icons.search,
      ),
    );
  }

  Widget _usersList(List<FullUser> users) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: users.length, //users.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(
              left: 5.0,
              right: 5.0,
            ),
            width: 75,
            child: GestureDetector(
              onTap: (){
                Get.toNamed(Director.PROFILE.route,  arguments: users[index]);
              },
              child: Column(
                children: [
                  RoundImage(
                    width: 50,
                    height: 50,
                    url: users[index].photo_url??"",
                  ),
                  Text(
                    users[index].username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _roomsList(List<Club> clubs) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        bottom: 80,
        left: 20,
        right: 20,
      ),
      itemBuilder: (lc, index) {
        return GestureDetector(
          onTap: () {
            // enterRoom(room);
          },
          child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: _clubsSearch(clubs[index])
          ),
        );
      },
      itemCount: clubs.length,
    );
  }

  Widget _clubsSearch(Club club) {
    return Container(
      child: Row(
        children: [
          RoundImage(
            url: club.photo_url??"",
            width: 70,
            height: 70,
            borderRadius: 27,
          ),
          SizedBox(width: 10,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(club.name, style: TextStyle(fontSize: 17),
                textAlign: TextAlign.start,),
              SizedBox(height: 8,),
              Row(children: [
                Text(club.num_followers.toString()),
                Text("followers".tr),
                SizedBox(width: 20,),
                Text(club.num_members.toString()),
                Text("followings".tr),
              ],)

            ],)
        ],
      ),
    );
  }
}
