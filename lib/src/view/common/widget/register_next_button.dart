import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'round_button.dart';

class RegisterNextButton extends StatelessWidget {

  final Function onPressed;
  final String text;

  RegisterNextButton(this.text, [this.onPressed]);


  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: Get.theme.accentColor,
      minimumWidth: 230,
      disabledColor: Get.theme.accentColor.withOpacity(0.3),
      onPressed: onPressed,
      child: Container(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
