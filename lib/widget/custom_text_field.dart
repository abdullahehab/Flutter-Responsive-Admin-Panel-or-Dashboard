import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';

import '../constants.dart';
import 'components.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hint;
  final String? outLineText;
  final bool? obscureText;
  final ValueChanged<String>? onChangedText;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final Color? backGroundColor;
  final TextInputType? textInputType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? iconPath;
  final double? iconPathWidth;
  final double? borderRadius;
  final double? height;
  final Color? borderColor;
  final double? textFieldWidth;
  final TextStyle? hintTextStyle;
  final int? maxLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final ValueNotifier<bool>? obscurePasswordNotifier;
  final VoidCallback? obscureChanged;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  bool requiredFiled = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (outLineText != null)
          Row(
            children: [
              Text(
                outLineText!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              requiredFiled
                  ? Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        height: 1,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        SizedBox(height: 5),
        ValueListenableBuilder(
            valueListenable:
                obscurePasswordNotifier ?? ValueNotifier<bool>(false),
            builder: (BuildContext context, bool obSecure, _) =>
                FormField<String>(
                  validator: (String? value) {
                    if (validator != null) {
                      final String? valid =
                          validator!(value ?? initialValue ?? '');

                      return valid;
                    }

                    return null;
                  },
                  builder: (field) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: backGroundColor,
                        width: textFieldWidth ?? context.width,
                        height: height ?? 43.h,
                        child: TextFormField(
                          textInputAction: textInputAction,
                          onChanged: (String value) {
                            field.setValue(value);
                            field.validate();

                            onChangedText!.call(value);
                          },
                          onFieldSubmitted: onFieldSubmitted,
                          obscureText: obSecure,
                          initialValue: initialValue ?? null,
                          controller: controller,
                          keyboardType: textInputType,
                          enabled: enabled,
                          style: TextStyle(decoration: TextDecoration.none),
                          maxLines: maxLines ?? 1,
                          maxLength: maxLength,
                          focusNode: focusNode,
                          decoration: new InputDecoration(
                            counterText: "",
                            fillColor: Colors.red,
                            suffixIcon: obscurePasswordNotifier != null
                                ? Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      borderRadius: BorderRadius.circular(
                                          borderRadius ?? APP_BORDER_RADIUS),
                                    ),
                                    child: IconButton(
                                      color: AppColor.black,
                                      iconSize: 18,
                                      icon: Icon(
                                        obSecure
                                            ? FontAwesomeIcons.solidEye
                                            : FontAwesomeIcons.solidEyeSlash,
                                      ),
                                      onPressed: () {
                                        obscurePasswordNotifier!.value =
                                            !obSecure;
                                        if (obscureChanged != null) {
                                          obscureChanged!();
                                        }
                                      },
                                    ),
                                  ).addPaddingAll(1)
                                : suffixIcon ?? null,
                            border: InputBorder.none,
                            hintText: hint,
                            contentPadding: contentPadding ?? EdgeInsets.zero,
                            hintStyle: hintTextStyle,
                            prefixIcon: prefixIcon,
                            focusedBorder: border(hasError: field.hasError),
                            enabledBorder: border(hasError: field.hasError),
                            errorBorder: border(hasError: field.hasError),
                            disabledBorder: border(hasError: field.hasError),
                            focusedErrorBorder:
                                border(hasError: field.hasError),
                          ),
                        ),
                      ),
                      if (validator != null)
                        (field.hasError)
                            ? Text(
                                '${field.errorText}',
                                style: TextStyle(
                                  fontSize: 10.h,
                                  height: 0.6,
                                  color: Colors.red.shade800,
                                ),
                              ).addPaddingOnly(right: 0, top: 10)
                            : const SizedBox(
                                height: 0,
                              ),
                    ],
                  ),
                )),
      ],
    );
  }

  InputBorder? border({required hasError}) {
    return inputBorder(
        borderColor:
            hasError ? Colors.red : borderColor ?? AppColor.kPrimaryColor);
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
      this.maxLength,
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
      this.validator,
      this.focusNode,
      this.initialValue,
      this.obscureText = false,
      this.requiredFiled = false,
      this.onChangedText,
      this.enabled});
}
