import 'package:club_house/src/controller/MainPageController.dart';
import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/utils/data.dart';
import 'package:club_house/src/view/common/widget/room_card.dart';
import 'package:club_house/src/view/common/widget/round_button.dart';
import 'package:club_house/src/view/common/widget/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LobbyPage extends StatelessWidget {

  final MainPageController _controller;

  LobbyPage(this._controller);

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _controller.refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _controller.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SmartRefresher(
           enableTwoLevel: true,
          enablePullDown: true,
          controller: _controller.refreshController,
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
                return _buildScheduleCard();
              }
              return buildRoomCard(_controller.channels[index-1]);
            },
            itemCount: _controller.channels.length+1,
          ),
        ),
        // buildGradientContainer(),
        // buildStartRoomButton(),
      ],
    );
  }

  Widget _buildScheduleCard() {
    final eventsize = _controller.events.length;
    if(eventsize>0){
      return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: ScheduleCard(_controller.events),
      );
    }else{
      return Container();
    }
  }

  Widget buildRoomCard(Channel channel) {
    return GestureDetector(
      onTap: () {
        // enterRoom(room);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: RoomCard(
          channel: channel,
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
