import 'package:club_house/src/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:club_house/src/view/common/colors.dart' as Colory;
import 'package:get/get.dart';

class ScheduleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colory.Colors.AccentBrown,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0, len = 3; i < len; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildScheduleItem('0${7 + i}:00 PM', dummyText),
            )
        ],
      ),
    );
  }

  Widget buildScheduleItem(String time, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75,
          child: Text(
            time,
            style: TextStyle(
              color: Colory.Colors.DarkBrown,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'COMMUNITY CLUB',
                    style: TextStyle(
                      color: Get.theme.buttonColor,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.home,
                    color: Get.theme.buttonColor,
                    size: 15,
                  )
                ],
              ),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
