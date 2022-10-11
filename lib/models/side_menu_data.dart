import 'package:admin/screens/main/users_data.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';
import '../features/social_status/presentation/screens/list.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/people_screen/people_screen.dart';

class SideMenuData {
  final String? title, imagePath;
  final GestureTapCallback? onTap;
  final IconData? icon;
  final Widget? itemWidget;
  final String? key;

  SideMenuData(
      {required this.title,
      required this.key,
      this.imagePath,
      required this.onTap,
      this.icon,
      required this.itemWidget});
}

List<SideMenuData> items = [
  SideMenuData(
      title: 'الرئيسية',
      icon: FontAwesomeIcons.dashcube,
      key: HOME_KEY,
      onTap: () => Navigator.pushNamed(Get.context!, PageRouteName.MAIN_SCREEN),
      itemWidget: DashboardScreen()),
  SideMenuData(
      title: 'العملاء',
      key: USERS_KEY,
      icon: FontAwesomeIcons.users,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.PEOPLE_SCREEN),
      itemWidget: PeopleScreen()),
  SideMenuData(
      title: 'الحالة الاجتماعية',
      key: '',
      icon: FontAwesomeIcons.users,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.SOCIAL_STATUES_SCREEN),
      itemWidget: SocialStatuesList()),
  SideMenuData(
      title: 'الوظيفه',
      key: '',
      icon: FontAwesomeIcons.briefcase,
      onTap: () {},
      itemWidget: Center(child: Text('الوظيفه'))),
  SideMenuData(
      title: 'السكمن',
      key: '',
      icon: FontAwesomeIcons.houseUser,
      onTap: () {},
      itemWidget: Center(child: Text('السكمن'))),
  SideMenuData(
      title: 'حيازه',
      key: '',
      icon: FontAwesomeIcons.userTag,
      onTap: () {},
      itemWidget: Center(child: Text('حيازه'))),
];
