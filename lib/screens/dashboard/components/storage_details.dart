import 'package:admin/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import 'package:admin/extensions/extension.dart';
class LoggedInUserDetails extends StatelessWidget {
  const LoggedInUserDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "بيانات العميل",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          CustomTextField(
            contentPadding: EdgeInsets.only(right: 10),
            outLineText: 'الاسم',
            hint: 'الاسم',
            iconPathWidth: 17,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ).addPaddingHorizontalVertical(horizontal: 16),
          SizedBox(height: defaultPadding),
          CustomTextField(
            contentPadding: EdgeInsets.only(right: 10),
            outLineText: 'البريد الإلكتروني',
            hint: 'اكتب البريد الإلكتروني',
            iconPathWidth: 17,
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ).addPaddingHorizontalVertical(horizontal: 16),
        ],
      ),
    );
  }
}
