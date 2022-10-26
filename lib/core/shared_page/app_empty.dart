import 'package:admin/core/shared_components/build_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

Widget appEmpty({
  String title = "لا يوجد بيانات",
  String msg = "قم بإضافة بيانتك الان",
  required void Function()? onPressed,
}) {
  return Scaffold(
    body: Center(
      child: Container(
        width: Get.width * 0.4,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
              offset: Offset(
                0,
                0,
              ),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   'assets/lottiefiles/98194-loading.json',
            // ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Center(
                child: Text(
                  msg,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    height: 2,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            DividerX(),
            SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColor.kPrimaryDarkColor,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color:  AppColor.kPrimaryDarkColor),
                  ),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'أضافة  عنصر جديد',
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // icon: Icon(Icons.add),
              onPressed: onPressed,
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    ),
  );
}
