import 'package:club_house/src/models/Channel.dart';
import 'package:club_house/src/utils/Utils.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Channel channel;

  const RoomCard({Key key, this.channel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(0, 1),
        )
      ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            channel.topic ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              buildProfileImages(),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildUserList(),
                      SizedBox(
                        height: 5,
                      ),
                      buildRoomInfo(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildProfileImages() {
    return Stack(
      children: [
        RoundImage(
          margin: EdgeInsets.only(top: 15, right: Utils.isRtl() ? 25 : 0, left: Utils.isRtl() ? 0 : 25),
          url: channel.users[0].photo_url,
        ),
        RoundImage(
          url: channel.users[1].photo_url,
        ),
        if (channel.users.length > 2)
          RoundImage(
            margin: const EdgeInsets.only(top: 30),
            url: channel.users[2].photo_url,
          ),
      ],
    );
  }

  Widget buildUserList() {
    var len = channel.users.length > 4 ? 4 : channel.users.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < len; i++)
          Container(
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    child: Text(
                      channel.users[i].name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.chat,
                  color: Colors.grey,
                  size: 14,
                ),
              ],
            ),
          )
      ],
    );
  }

  Widget buildRoomInfo() {
    return Row(
      children: [
        Text(
          '${channel.users.length}',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Icon(
          Icons.supervisor_account,
          color: Colors.grey,
          size: 14,
        ),
        Text(
          '  /  ',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 10,
          ),
        ),
        Text(
          '${channel.num_all}',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Icon(
          Icons.chat_bubble_rounded,
          color: Colors.grey,
          size: 14,
        ),
      ],
    );
  }
}
