import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/people_details/people_details.dart';
import 'package:admin/screens/people_screen/people_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItems {
  final String? title;
  final GestureTapCallback? onTap;
  final IconData? iconData;
  final Widget? itemWidget;

  MenuItems(
      {@required this.title,
      @required this.onTap,
      @required this.iconData,
      @required this.itemWidget});
}

List<MenuItems> menuItems = [
  MenuItems(
      title: 'DashBoard',
      onTap: () => print('DashBoard tapped'),
      iconData: Icons.dashboard,
      itemWidget: DashboardScreen()),
  MenuItems(
      title: 'people',
      onTap: () => print('people tapped'),
      iconData: FontAwesomeIcons.userFriends,
      itemWidget: PeopleScreen()),
  MenuItems(
      title: 'people',
      onTap: () => print('people tapped'),
      iconData: FontAwesomeIcons.userFriends,
      itemWidget: PeopleDetails()),
];
