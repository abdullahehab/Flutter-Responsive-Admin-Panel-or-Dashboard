import 'package:admin/features/working/presentation/screens/list.dart';
import 'package:admin/screens/main/users_data.dart';
import 'package:admin/services/service_locator.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../core/constants/constants.dart';
import '../features/add_new_user/presentation/pages/list.dart';
import '../features/housing/presentation/screens/list.dart';
import '../features/owning/presentation/screens/list.dart';
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
  // SideMenuData(
  //     title: 'الرئيسية',
  //     icon: FontAwesomeIcons.dashcube,
  //     key: HOME_KEY,
  //     onTap: () => Navigator.pushNamed(Get.context!, PageRouteName.MAIN_SCREEN),
  //     itemWidget: DashboardScreen()),
  SideMenuData(
      title: 'الأشخاص',
      key: USERS_KEY,
      icon: FontAwesomeIcons.users,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.PEOPLE_SCREEN),
      itemWidget: UsersList()
      // itemWidget: PeopleScreen()
  ),
  SideMenuData(
      title: 'الحالة الاجتماعية',
      key: '',
      icon: FontAwesomeIcons.users,
      onTap: () => Navigator.pushNamed(
          Get.context!, PageRouteName.SOCIAL_STATUES_SCREEN),
      itemWidget: SocialStatuesList()),
  SideMenuData(
      title: 'الوظيفة',
      key: '',
      icon: FontAwesomeIcons.briefcase,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.WORKS_SCREEN),
      itemWidget: WorksList()),
  SideMenuData(
      title: 'السكن',
      key: '',
      icon: FontAwesomeIcons.houseUser,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.HOUSING_SCREEN),
      itemWidget: HousingList()),
  SideMenuData(
      title: 'حيازة',
      key: '',
      icon: FontAwesomeIcons.userTag,
      onTap: () =>
          Navigator.pushNamed(Get.context!, PageRouteName.OWNING_SCREEN),
      itemWidget: OwningList()),
];
