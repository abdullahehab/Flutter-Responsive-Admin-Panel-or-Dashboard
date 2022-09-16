import 'package:admin/extensions/extension.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:admin/widget/main_button.dart';
import 'package:admin/widget/people_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Responsive.isMobile() ? Drawer(child: SideMenu()) : null,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'العملاء',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: false,
          actions: [
            // CustomButton(
            //   width: 70.w,
            //   height: 30.h,
            //   text: 'إضافة جديد',
            //   onPressed: () => context
            //       .read<MenuController>()
            //       .setSelectedMenuIndex = menuItems.indexOf(menuItems.last),
            //   buttonColor: AppColor.buttonColor,
            // )
          ],
        ),
        backgroundColor: AppColor.mainBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Responsive.isDesktop()
                  ? Wrap(
                      spacing: Responsive.isMobile() ? 10 : 0,
                      runSpacing: Responsive.isMobile() ? 10 : 0,
                      children: [
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                        '1',
                        '2',
                        '3',
                        '4',
                        '5',
                        '6',
                      ]
                          .map(
                              (e) => buildSingleCard(context).addPaddingAll(10))
                          .toList(),
                    )
                  : buildSingleCard(context, width: context.width)
                      .addPaddingHorizontalVertical(horizontal: 20)
            ],
          ),
        )),
        floatingActionButton: CustomButton(
          width: context.width * .3,
          // height: 30.h,
          text: 'إضافة جديد',
          onPressed: () {
            Get.toNamed(PageRouteName.ADD_NEW);
          },
          buttonColor: AppColor.kPrimaryDarkColor,
        ));
  }

  Container buildSingleMobileCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.person_outline,
            color: Colors.black54,
          ),
          ListTile(
            title: Text('الاسم'),
            subtitle: Text('عبد الله ايهاب سعد'),
          ),
          ListTile(
            title: Text('عدد الابناء'),
            subtitle: SizedBox(
              child: Text('5'),
              width: context.width * .4,
            ),
            // Text(''),
          ),
          ListTile(
            title: Text('الرقم القومي'),
            subtitle: Text('١١١١١١١١١١١١١١'),
          ),
          CustomButton(
            onPressed: () {},
            text: "عرض التفاصيل",
            buttonColor: AppColor.kPrimaryColor,
          )
        ],
      ).addPaddingHorizontalVertical(vertical: 20),
    );
  }
}
