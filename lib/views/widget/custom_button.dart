import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/AppColor.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        padding: EdgeInsets.all(18),
        onPressed: onPressed,
        color: AppColor.primarySoft,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        )
    );
  }
}
