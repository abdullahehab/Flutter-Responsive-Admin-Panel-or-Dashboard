
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenuData {
  final String? title, imagePath;
  final GestureTapCallback? onTap;
  final IconData? icon;

  SideMenuData(
      {@required this.title, this.imagePath, @required this.onTap, this.icon});
}

List<SideMenuData> items = [
  SideMenuData(
      title: 'الرئيسية', icon: FontAwesomeIcons.dashcube, onTap: () {}),
  SideMenuData(title: 'العملاء', icon: FontAwesomeIcons.users, onTap: () {}),
];

List<SideMenuData> subItems = [
  SideMenuData(
      title: 'الحالة الاجتماعية', icon: FontAwesomeIcons.users, onTap: () {}),
  SideMenuData(
    title: 'الوظيفه',
    icon: FontAwesomeIcons.briefcase,
    onTap: () {},
  ),
  SideMenuData(
      title: 'السكمن', icon: FontAwesomeIcons.houseUser, onTap: () {}),
  SideMenuData(title: 'حيازه', icon: FontAwesomeIcons.userTag, onTap: () {}),
];