import 'package:club_house/src/view/common/colors.dart' as Colory;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:club_house/src/view/common/widget/round_image.dart';
import 'package:club_house/src/view/common/widget/round_button.dart';
import 'package:club_house/src/utils/data.dart';

class LobbyBottomSheet extends StatefulWidget {
  final Function onButtonTap;

  const LobbyBottomSheet({Key key, this.onButtonTap}) : super(key: key);

  @override
  _LobbyBottomSheetState createState() => _LobbyBottomSheetState();
}

class _LobbyBottomSheetState extends State<LobbyBottomSheet> {
  var selectedButtonIndex = 0;

  List lobbyBottomSheets = [
    {
      'image': 'assets/images/open.png',
      'text': 'open'.tr,
      'selectedMessage': 'open_room_desc'.tr,
    },
    {
      'image': 'assets/images/social.png',
      'text': 'social'.tr,
      'selectedMessage': 'social_room_desc'.tr,
    },
    {
      'image': 'assets/images/closed.png',
      'text': 'closed'.tr,
      'selectedMessage': 'closed_room_desc'.tr,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: 20,
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              'add_topic'.tr,
              style: TextStyle(
                color: Get.theme.buttonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0, len = 3; i < len; i++)
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    setState(() {
                      selectedButtonIndex = i;
                    });
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                        color: i == selectedButtonIndex
                            ? Colory.Colors.SelectedItemGrey.withOpacity(0.5)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: i == selectedButtonIndex
                              ? Colory.Colors.SelectedItemBorderGrey
                              : Colors.transparent,
                        )),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: RoundImage(
                            width: 80,
                            height: 80,
                            borderRadius: 20,
                            path: lobbyBottomSheets[i]['image'],
                          ),
                        ),
                        Text(
                          lobbyBottomSheets[i]['text'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 60,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            lobbyBottomSheets[selectedButtonIndex]['selectedMessage'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RoundButton(
            color: Get.theme.buttonColor,
            onPressed: widget.onButtonTap,
            text: 'lets_go'.tr,
          )
        ],
      ),
    );
  }
}
