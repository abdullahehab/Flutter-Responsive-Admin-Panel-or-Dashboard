import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/side_menu_items.dart';
import 'package:admin/screens/people_screen/people_screen.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/utils/resources.dart';
import 'package:admin/widget/main_button.dart';
import 'package:admin/widget/people_card.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../responsive.dart';

class PeopleDetails extends StatelessWidget {
  const PeopleDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(child: mobileWidget(context)),
      ),
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

  Widget deskTopWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Flexible(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('العنوان'),
                      subtitle: Text('العاشر من رمضان الشرقيه'),
                    ),
                    ListTile(
                      title: Text('الاسم'),
                      subtitle: Text('عبد الله ايهاب سعد'),
                    ),
                    ListTile(
                      title: Text('الشخص'),
                      subtitle: Text('سليم'),
                    ),
                    ListTile(
                      title: Text('الرقم القومي'),
                      subtitle: Text('11111111111111'),
                    ),
                    ListTile(
                      title: Text('الحالة الاجتماعية'),
                      subtitle: Text('متزوج'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('تاريخ الميلاد'),
                      subtitle: Text('8/3/1997'),
                    ),
                    ListTile(
                      title: Text('الوظيفه'),
                      subtitle: Text('رئيس قسم المنتجا في المطار'),
                    ),
                    ListTile(
                      title: Text('الحالة الصحية'),
                      subtitle: Text('سليم'),
                    ),
                    ListTile(
                      title: Text('السكن'),
                      subtitle: Text('منزل'),
                    ),
                    ListTile(
                      title: Text('حيازه'),
                      subtitle: Text('ارض زراعيه'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: DottedLine(
                  dashLength: 10,
                  dashGapLength: 4,
                  lineThickness: 1.3,
                  dashColor: Colors.grey,
                  dashGapColor: Colors.white,
                  direction: Axis.vertical,
                  lineLength: 300,
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('العنوان'),
                      subtitle: Text('العاشر من رمضان الشرقيه'),
                    ),
                    ListTile(
                      title: Text('الاسم'),
                      subtitle: Text('عبد الله ايهاب سعد'),
                    ),
                    ListTile(
                      title: Text('الشخص'),
                      subtitle: Text('سليم'),
                    ),
                    ListTile(
                      title: Text('الرقم القومي'),
                      subtitle: Text('11111111111111'),
                    ),
                    ListTile(
                      title: Text('الحالة الاجتماعية'),
                      subtitle: Text('متزوج'),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    ListTile(
                      title: Text('تاريخ الميلاد'),
                      subtitle: Text('8/3/1997'),
                    ),
                    ListTile(
                      title: Text('الوظيفه'),
                      subtitle: Text('رئيس قسم المنتجا في المطار'),
                    ),
                    ListTile(
                      title: Text('الحالة الصحية'),
                      subtitle: Text('سليم'),
                    ),
                    ListTile(
                      title: Text('السكن'),
                      subtitle: Text('منزل'),
                    ),
                    ListTile(
                      title: Text('حيازه'),
                      subtitle: Text('ارض زراعيه'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ).addPaddingAll(10),
        Text(
          'الابناء',
          style: Theme.of(context).textTheme.headline6,
        ).addPaddingOnly(right: 10, top: 20),
        Wrap(
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
                (e) => Responsive.isDesktop()
                    ? buildSingleCard(context).addPaddingAll(10)
                    : buildSingleMobileCard(context).addPaddingAll(0),
              )
              .toList(),
        )
      ],
    );
  }

  Widget mobileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.transparent,
                    child: SvgPicture.asset(
                      Resources.maleIcon,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('العنوان'),
                              subtitle: Text('العاشر من رمضان الشرقيه'),
                            ),
                            ListTile(
                              title: Text('الاسم'),
                              subtitle: Text('عبد الله ايهاب سعد'),
                            ),
                            ListTile(
                              title: Text('الشخص'),
                              subtitle: Text('سليم'),
                            ),
                            ListTile(
                              title: Text('الرقم القومي'),
                              subtitle: Text('11111111111111'),
                            ),
                            ListTile(
                              title: Text('الحالة الاجتماعية'),
                              subtitle: Text('متزوج'),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('تاريخ الميلاد'),
                              subtitle: Text('8/3/1997'),
                            ),
                            ListTile(
                              title: Text('الوظيفه'),
                              subtitle: Text('رئيس قسم المنتجا في المطار'),
                            ),
                            ListTile(
                              title: Text('الحالة الصحية'),
                              subtitle: Text('سليم'),
                            ),
                            ListTile(
                              title: Text('السكن'),
                              subtitle: Text('منزل'),
                            ),
                            ListTile(
                              title: Text('حيازه'),
                              subtitle: Text('ارض زراعيه'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ).addPaddingHorizontalVertical(vertical: 20),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Container(
          width: context.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    foregroundColor: Colors.transparent,
                    child: SvgPicture.asset(
                      Resources.femaleIcon,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('الاسم'),
                              subtitle: Text('جهاد عبد العزيز حلمي'),
                            ),
                            ListTile(
                              title: Text('العنوان'),
                              subtitle: Text('العاشر من رمضان الشرقيه'),
                            ),
                            ListTile(
                              title: Text('الشخص'),
                              subtitle: Text('سليم'),
                            ),
                            ListTile(
                              title: Text('الرقم القومي'),
                              subtitle: Text('11111111111111'),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: [
                            ListTile(
                              title: Text('تاريخ الميلاد'),
                              subtitle: Text('8/3/1997'),
                            ),
                            ListTile(
                              title: Text('الوظيفه'),
                              subtitle: Text('رئيس قسم المنتجا في المطار'),
                            ),
                            ListTile(
                              title: Text('الحالة الصحية'),
                              subtitle: Text('سليم'),
                            ),
                            ListTile(
                              title: Text('السكن'),
                              subtitle: Text('منزل'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ).addPaddingHorizontalVertical(vertical: 20),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text('الابناء'),
        SizedBox(
          height: 10.h,
        ),
        ...['1', '2', '3'].map((e) =>
            buildSingleCard(context, width: context.width)
                .addPaddingOnly(bottom: 10))
      ],
    ).addPaddingOnly(right: 20, left: 20, top: 10);
  }
}
