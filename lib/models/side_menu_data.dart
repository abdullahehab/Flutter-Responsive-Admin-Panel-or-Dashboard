import 'package:admin/screens/main/users_data.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SideMenuData {
  final String? title, imagePath;
  final GestureTapCallback? onTap;
  final IconData? icon;

  SideMenuData(
      {@required this.title, this.imagePath, @required this.onTap, this.icon});
}

List<SideMenuData> items = [
  SideMenuData(
      title: 'الرئيسية',
      icon: FontAwesomeIcons.dashcube,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.MAIN_SCREEN)),
  SideMenuData(
      title: 'العملاء',
      icon: FontAwesomeIcons.users,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.PEOPLE_SCREEN)),
  SideMenuData(
      title: 'الحالة الاجتماعية', icon: FontAwesomeIcons.users, onTap: () {}),
  SideMenuData(
    title: 'الوظيفه',
    icon: FontAwesomeIcons.briefcase,
    onTap: () {},
  ),
  SideMenuData(title: 'السكمن', icon: FontAwesomeIcons.houseUser, onTap: () {}),
  SideMenuData(title: 'حيازه', icon: FontAwesomeIcons.userTag, onTap: () {}),
];


