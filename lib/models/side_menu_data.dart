import 'package:admin/screens/main/users_data.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/people_screen/people_screen.dart';

class SideMenuData {
  final String? title, imagePath;
  final GestureTapCallback? onTap;
  final IconData? icon;
  final Widget? itemWidget;

  SideMenuData(
      {required this.title,
      this.imagePath,
      required this.onTap,
      this.icon,
      required this.itemWidget});
}

List<SideMenuData> items = [
  SideMenuData(
      title: 'الرئيسية',
      icon: FontAwesomeIcons.dashcube,
      onTap: () => Navigator.pushNamed(Get.context!, PageRouteName.MAIN_SCREEN),
      itemWidget: DashboardScreen()),
  SideMenuData(
      title: 'العملاء',
      icon: FontAwesomeIcons.users,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.PEOPLE_SCREEN),
      itemWidget: PeopleScreen()),
  SideMenuData(
      title: 'الحالة الاجتماعية',
      icon: FontAwesomeIcons.users,
      onTap: () {},
      itemWidget: DashboardScreen()),
  SideMenuData(
      title: 'الوظيفه',
      icon: FontAwesomeIcons.briefcase,
      onTap: () {},
      itemWidget: Center(child: Text('الوظيفه'))),
  SideMenuData(
      title: 'السكمن',
      icon: FontAwesomeIcons.houseUser,
      onTap: () {},
      itemWidget: Center(child: Text('السكمن'))),
  SideMenuData(
      title: 'حيازه',
      icon: FontAwesomeIcons.userTag,
      onTap: () {},
      itemWidget: Center(child: Text('حيازه'))),
];
