import 'package:club_house/src/utils/data.dart';
import 'package:club_house/src/view/common/widget/room_card.dart';
import 'package:club_house/src/view/common/widget/round_button.dart';
import 'package:club_house/src/view/common/widget/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SmartRefresher(
          enablePullDown: true,
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: ListView.builder(
            padding: const EdgeInsets.only(
              bottom: 80,
              left: 20,
              right: 20,
            ),
            itemBuilder: (lc, index) {
              if (index == 0) {
                return buildScheduleCard();
              }
              return buildRoomCard(rooms[index - 1]);
            },
            // itemCount: rooms.length + 1,
            itemCount: 2,
          ),
        ),
        // buildGradientContainer(),
        buildStartRoomButton(),
      ],
    );
  }

  Widget buildScheduleCard() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: ScheduleCard(),
    );
  }

  Widget buildRoomCard(Room room) {
    return GestureDetector(
      onTap: () {
        // enterRoom(room);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RoomCard(
          room: room,
        ),
      ),
    );
  }

  Widget buildGradientContainer() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Get.theme.buttonColor.withOpacity(0.0),
              Get.theme.buttonColor,
            ],
          )),
    );
  }

  Widget buildStartRoomButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: RoundButton(
          onPressed: () {
            // showBottomSheet();
          },
          color: Get.theme.buttonColor,
          text: '+ Start a room'),
    );
  }

  // enterRoom(Room room) {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (rc) {
  //       return RoomPage(
  //         room: room,
  //       );
  //     },
  //   );
  // }

  // showBottomSheet() {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(15),
  //           topRight: Radius.circular(15),
  //         )),
  //     builder: (context) {
  //       return Wrap(
  //         children: [
  //           LobbyBottomSheet(
  //             onButtonTap: () {
  //               Navigator.pop(context);
  //
  //               enterRoom(
  //                 Room(
  //                   title: '${myProfile.name}\'s Room',
  //                   users: [myProfile],
  //                   speakerCount: 1,
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
}
