import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/side_menu_items.dart';
import 'package:admin/screens/people_screen/people_screen.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../responsive.dart';

class PeopleDetails extends StatelessWidget {
  const PeopleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kMainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: context.width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الاسم'),
                            subtitle: Text('عبد الله ايهاب'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('العنوان'),
                            subtitle: Text('العاشر من رمضان الشرقيه'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الشخص'),
                            subtitle: Text('سليم'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الرقم القومي'),
                            subtitle: Text('11111111111111'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('اسم الزوج/ الزوجة'),
                            subtitle: Text('جهاد عبد العزيز حلمي'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الحالة الاجتماعية'),
                            subtitle: Text('متزوج'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('تاريخ الميلاد'),
                            subtitle: Text('8/3/1997'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الوظيفه'),
                            subtitle: Text('رئيس قسم المنتجا في المطار'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('الحالة الصحية'),
                            subtitle: Text('سليم'),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('عدد الأبناء'),
                            subtitle: Text('2'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('السكن'),
                            subtitle: Text('منزل'),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text('حيازه'),
                            subtitle: Text('ارض زراعيه'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ).addPaddingAll(10),
              Text(
                'الابناء',
                style: Theme.of(context).textTheme.headline6,
              ).addPaddingOnly(right: 10, top: 20),
              Wrap(
                spacing: Responsive.isMobile(context) ? 10 : 0,
                runSpacing: Responsive.isMobile(context) ? 10 : 0,
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
                      (e) => Responsive.isDesktop(context)
                          ? buildSingleCard(context).addPaddingAll(10)
                          : buildSingleMobileCard(context).addPaddingAll(0),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildSingleCard(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text('الاسم'),
                  subtitle: Text('عبد الله ايهاب سعد'),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text('عدد الابناء'),
                  subtitle: SizedBox(
                    child: Text('5'),
                    width: context.width * .4,
                  ),
                  // Text(''),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text('تاريخ الميلاد'),
                  subtitle: Text('8/3/1009'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: ListTile(
                  title: Text('التليفون'),
                  subtitle: Text('٠٠١١١٥٩٢٢٢٤٠'),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text('السكن'),
                  subtitle: Text('منزل'),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text('الحاله الاجتماعيه'),
                  subtitle: Text('اعزب'),
                ),
              ),
            ],
          ),
          CustomButton(
            onPressed: () {
              context.read<MenuController>().setSelectedMenuIndex =
                  menuItems.indexOf(menuItems.last);
            },
            height: 50.h,
            text: "عرض التفاصيل",
            buttonColor: AppColor.kPrimaryColor,
          )
        ],
      ).addPaddingHorizontalVertical(vertical: 20),
    );
  }

  Container buildSingleMobileCard(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.symmetric(horizontal: 2.w),
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
