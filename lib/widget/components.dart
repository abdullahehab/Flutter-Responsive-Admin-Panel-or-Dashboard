// @dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants.dart';

Widget customRichText({
  @required BuildContext context,
  @required String firstText,
  @required String secondText,
  @required TextStyle firstTextStyle,
  @required TextStyle secondTextStyle,
  VoidCallback onFirstTextTapped,
  VoidCallback onSecondTextTapped,
}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        text: firstText,
        style: firstTextStyle,
        recognizer: TapGestureRecognizer()..onTap = onFirstTextTapped,
        children: <TextSpan>[
          TextSpan(
            text: secondText,
            style: secondTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onSecondTextTapped,
          ),
        ]),
  );
}

void showToast(
    {@required String message, Color backgroundColor = Colors.black}) {
  HapticFeedback.lightImpact();
  Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0);
}



InputBorder inputBorder({Color borderColor, double borderRadius}) =>
    OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(borderRadius ?? APP_BORDER_RADIUS),
      borderSide: BorderSide(
        color: borderColor ?? primaryColor,
        width: 1.0,
      ),
    );
