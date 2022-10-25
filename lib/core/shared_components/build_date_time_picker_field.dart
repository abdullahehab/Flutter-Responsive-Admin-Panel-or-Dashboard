import 'dart:developer';

import 'package:admin/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import '../constants/constants.dart';

Widget buildDateTimePickerField(
    {String? labelText,
    String? hintText,
    required void Function(int?)? onSaved,
    int? initialValue,
    TextInputType? keyboardType,
    double? fieldHeight = 40,
    TextEditingController? controller,
    String? Function(String?)? validator,
    List<TextInputFormatter>? inputFormatters,
    bool requiredFiled = false,
    void Function(String)? onFieldSubmitted,
    int? firstDate,
    int? lastDate,
    bool readOnly = false}) {
  var date = initialValue.obs;

  if (date.value == null) {
    date = DateTime.now().millisecondsSinceEpoch.obs;
  } else {
    var initDate = DateTime.fromMillisecondsSinceEpoch(date.value!)
        .toString()
        .substring(0, readOnly ? 16 : 10);
    controller = TextEditingController(text: initDate);
  }

  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Row(
            children: [
              Text(
                labelText,
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
        SizedBox(height: 10.h),
        InkWell(
          onTap: () {
            showDatePicker(
              locale: Locale('ar'),
              context: Get.context!,
              initialDate:
                  lastDate == null ? DateTime.now() : DateTime(lastDate),
              firstDate:
                  firstDate == null ? DateTime(1900) : DateTime(firstDate),
              lastDate: lastDate == null ? DateTime(2050) : DateTime(lastDate),
            ).then(
              (value) {
                if (value != null) {
                  log(value.toString());
                  date.value = value.millisecondsSinceEpoch;
                  onSaved?.call(value.millisecondsSinceEpoch);
                  controller = TextEditingController(
                      text: value.toString().substring(0, 10));
                }
              },
            );
          },
          child: Container(
            // height: fieldHeight,
            child: TextFormField(
              enabled: false,
              keyboardType: keyboardType,
              // initialValue: date.value,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  label: Text(hintText ?? ''),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: DateTime.fromMillisecondsSinceEpoch(date.value!)
                      .toString()
                      .dateFromString(),
                  border: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  focusedErrorBorder: border,
                  disabledBorder: border,
                  errorBorder: border),
              controller: controller,
              validator: validator,
              onFieldSubmitted: onFieldSubmitted,
              // onSaved: onSaved,
            ),
          ),
        ),
      ],
    );
  });
}

InputBorder? border = OutlineInputBorder(
    borderSide: BorderSide(color: AppColor.kPrimaryDarkColor),
    borderRadius: BorderRadius.circular(APP_BORDER_RADIUS));
