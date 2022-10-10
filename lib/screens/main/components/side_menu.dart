import 'package:admin/extensions/extension.dart';
import 'package:admin/models/side_menu_data.dart';
import 'package:admin/responsive.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'main_screen_controller.dart';

class SideMenu extends GetView<MainScreenController> {
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<MainScreenController>();
    return Drawer(
      child: ValueListenableBuilder(
        valueListenable: _selectedIndexNotifier,
        builder: (BuildContext context, int selectedIndex, _) => Container(
          color: AppColor.bgSideMenu,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              ...items.map((e) {
                int index = items.indexOf(e);
                bool selected = index == selectedIndex;
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
  final IconData? iconData;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        size: 14,
        color: Colors.white54,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
