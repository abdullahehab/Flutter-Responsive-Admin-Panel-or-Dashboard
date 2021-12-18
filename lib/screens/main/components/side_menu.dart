import 'package:admin/controllers/MenuController.dart';
import 'package:admin/models/side_menu_data.dart';
import 'package:admin/responsive.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  ValueNotifier<int> _selectedIndexNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    var provider = context.read<MenuController>();
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
                          provider.setSelectedMenuIndex = index;
                          if (Responsive.isMobile()) Navigator.pop(context);
                        },
                  child: DrawerListTile(
                    title: e.title!,
                    iconData: e.icon!,
                    selected: selected,
                  ),
                );
              }),
              ListTileTheme(
                  contentPadding: EdgeInsets.symmetric(horizontal: 13),
                  dense: true,
                  child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      initiallyExpanded: false,
                      iconColor: Colors.white54,
                      collapsedIconColor: Colors.white54,
                      title: ListTile(
                        title: Text(
                          'بيانات اخري',
                          style: TextStyle(
                            color: Colors.white54,
                          ),
                        ),
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(
                          FontAwesomeIcons.usersCog,
                          size: 14,
                          color: Colors.white54,
                        ).addPaddingOnly(right: 15),
                      ),
                      children: subItems
                          .map(
                            (e) => DrawerListTile(
                              title: e.title,
                              iconData: e.icon,
                              selected: false,
                            ).addPaddingOnly(right: 20),
                          )
                          .toList())),
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
