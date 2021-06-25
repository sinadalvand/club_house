import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'round_button.dart';

class RegisterNextButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double size;

  RegisterNextButton(this.text, [this.onPressed, this.size = 230]);

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      color: Get.theme.accentColor,
      minimumWidth: size,
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
              SizedBox(width: 5,),
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
