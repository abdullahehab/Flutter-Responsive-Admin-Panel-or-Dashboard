import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {@required this.text,
      @required this.onPressed,
      this.from,
      this.width,
      this.height,
      this.borderRadius,
      this.buttonPadding,
      this.forwardButton,
      this.backButton,
      this.titleStyle,
      this.buttonColor = const Color(0xff4d59c1),
      this.withoutPadding = false,
      this.padding});

  final String? text;
  final VoidCallback? onPressed;
  final String? from;
  final double? width, padding, height, borderRadius;
  final bool? withoutPadding;
  final EdgeInsets? buttonPadding;
  final Widget? forwardButton;
  final Widget? backButton;
  final TextStyle? titleStyle;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 4)),
      ),
      padding: buttonPadding ?? EdgeInsets.all(padding ?? 5),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: 0.0.toMaterialStateProperty(),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return buttonColor!;
              }

              if (states.contains(MaterialState.disabled)) {
                return buttonColor!.withOpacity(0.3);
              }

              return buttonColor!; // default color
            },
          ),
        ),
        onPressed: this.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (forwardButton != null) forwardButton!,
            Text(text!, style: titleStyle),
            if (backButton != null) backButton!,
          ],
        ),
      ),
    ).addPaddingHorizontalVertical(horizontal: !withoutPadding! ? 16 : 0);
  }
}
