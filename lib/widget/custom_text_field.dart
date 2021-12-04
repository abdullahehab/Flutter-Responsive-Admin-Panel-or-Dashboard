// @dart=2.9
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';

import 'components.dart';
class CustomTextField extends StatelessWidget {
  final Widget suffixIcon;
  final String hint;
  final String outLineText;
  final bool obscureText;
  final Function onChangedText;
  final TextEditingController controller;
  final EdgeInsetsGeometry contentPadding;
  final bool enabled;
  final Color backGroundColor;
  final TextInputType textInputType;
  final ValueChanged<String> onFieldSubmitted;
  final String iconPath;
  final double iconPathWidth;
  final double borderRadius;
  final double height;
  final Color borderColor;
  final double textFieldWidth;
  final TextStyle hintTextStyle;
  final int maxLines;
  final FocusNode focusNode;
  final ValueNotifier<bool> obscurePasswordNotifier;
  final VoidCallback obscureChanged;
  final TextInputAction textInputAction;
  final Widget prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outLineText != null)
          Text(
            outLineText,
          ),
        SizedBox(height: 5),
        ValueListenableBuilder(
            valueListenable:
                obscurePasswordNotifier ?? ValueNotifier<bool>(false),
            builder: (BuildContext context, bool obSecure, _) => Container(
                  color: backGroundColor,
                  width: textFieldWidth ?? context.width,
                  height: height ?? 43.h,
                  child: TextFormField(
                    textInputAction: textInputAction,
                    onChanged: onChangedText,
                    onFieldSubmitted: onFieldSubmitted,
                    obscureText: obSecure,
                    controller: controller,
                    keyboardType: textInputType,
                    enabled: enabled,
                    style: TextStyle(decoration: TextDecoration.none),
                    maxLines: maxLines ?? 1,
                    // cursorColor: AppColors.COLOR_1,
                    focusNode: focusNode,
                    decoration: new InputDecoration(
                      fillColor: Colors.red,
                      suffixIcon: obscurePasswordNotifier != null
                          ? Container(
                              // decoration: BoxDecoration(
                              //   color: AppColors.COLOR_9,
                              //   borderRadius: BorderRadius.circular(
                              //       borderRadius ??  Constants.APP_BORDER_RADIUS),
                              // ),
                              child: IconButton(
                                // color: AppColors.BLACK_COLOR,
                                iconSize: 18,
                                icon: Icon(
                                  obSecure
                                      ? FontAwesomeIcons.solidEye
                                      : FontAwesomeIcons.solidEyeSlash,
                                ),
                                onPressed: () {
                                  obscurePasswordNotifier.value = !obSecure;
                                  if (obscureChanged != null) {
                                    obscureChanged();
                                  }
                                },
                              ),
                            ).addPaddingAll(1)
                          : suffixIcon ?? null,
                      border: InputBorder.none,
                      hintText: hint,
                      contentPadding: contentPadding ?? EdgeInsets.zero,
                      // hintStyle: hintTextStyle ?? textFiledHintTextStyle,
                      prefixIcon: prefixIcon,
                      focusedBorder: inputBorder(borderColor: borderColor),
                      enabledBorder: inputBorder(borderColor: borderColor),
                      errorBorder: inputBorder(borderColor: borderColor),
                      disabledBorder: inputBorder(borderColor: borderColor),
                    ),
                  ),
                )),
      ],
    );
  }

  CustomTextField(
      {@required this.hint,
      @required this.textInputType,
       this.controller,
      this.iconPathWidth,
      this.suffixIcon,
      this.iconPath,
      this.height,
      this.hintTextStyle,
      this.maxLines,
      this.borderColor,
      this.onFieldSubmitted,
      this.textFieldWidth,
      this.contentPadding,
      this.obscureChanged,
      this.prefixIcon,
      this.obscurePasswordNotifier,
      this.backGroundColor,
      this.outLineText,
      this.borderRadius,
      this.textInputAction,
      this.focusNode,
      this.obscureText = false,
      this.onChangedText,
      this.enabled});
}
