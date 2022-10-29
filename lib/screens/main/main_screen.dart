import 'package:admin/responsive.dart';
import 'package:admin/screens/people_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../models/side_menu_data.dart';
import '../../utils/colors.dart';
import 'components/main_screen_controller.dart';
import 'components/side_menu.dart';

class MainScreen extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      builder: (DisposableInterface con) => Scaffold(
        appBar: Responsive.isMobile()
            ? AppBar(
                title: Text('الرئيسية'), backgroundColor: AppColor.bgSideMenu)
            : null,
        drawer: Responsive.isMobile() ? SideMenu() : null,
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop())
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child: SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: IndexedStack(
                  index: controller.selectedMenuIndex,
                  children: items
                      .map<Widget>((SideMenuData item) => MainView(item))
                      .toList(),
                ),
                // DashboardScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
