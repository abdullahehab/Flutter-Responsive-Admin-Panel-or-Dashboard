import 'package:flutter/material.dart';

import 'build_divider_widget.dart';

Widget buildHelperLabel(
    {required String helperText,
    String? text,
    Widget? child,
    double width = 350,
    final EdgeInsetsGeometry? dividerPadding,
    double sizedBoxWidth = 25}) {
  if (text == 'null') text = '-';

  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            SizedBox(
              width: sizedBoxWidth,
            ),
            SizedBox(
              width: width,
              child: Text(
                helperText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: child ?? (text == '' ? Text('-') : Text(text!)),
            ),
          ],
        ),
      ),
      DividerX(padding: dividerPadding)
    ],
  );
}
