import 'package:admin/models/side_menu_data.dart';
import 'package:admin/responsive.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'main_screen_controller.dart';

class SideMenu extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainScreenController>();
    return Drawer(
      child: Container(
        color: AppColor.bgSideMenu,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  'جمعية الديوان \nالنوبية الخيرية',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // child: Image.asset("assets/images/logo.png"),
            ),
            ...items.map((e) {
              int index = items.indexOf(e);
              bool selected = index == controller.selectedMenuIndex;
              return InkWell(
                onTap: Responsive.isMobile()
                    ? e.onTap
                    : () {
                        controller.setSelectedMenuIndex = index;
                        // controller.setSelectedKey = e.key!;
                        if (Responsive.isMobile()) Navigator.pop(context);
                      },
                child: DrawerListTile(
                  title: e.title!,
                  iconData: e.icon!,
                  selected: selected,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.selected,
    this.iconData,
  }) : super(key: key);

  final String? title;
  final String? iconData;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.fastOutSlowIn,
      margin: EdgeInsets.only(bottom: 10),
      color: selected ? AppColor.kMainBackgroundColor : Colors.transparent,
      child: ListTile(
        key: ValueKey(title),
        horizontalTitleGap: 0.0,
        leading: SvgPicture.asset(
          iconData!,
          color: selected ? AppColor.bgSideMenu : Colors.white54,
          width: 17.h,
          height: 17.h,
        ),
        title: Text(
          title!,
          style:
              TextStyle(color: selected ? AppColor.bgSideMenu : Colors.white54),
        ),
      ),
    );
  }
}
