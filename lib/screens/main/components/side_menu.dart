import 'package:admin/models/side_menu_data.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          ...items.map((e) {
            int index = items.indexOf(e);
            bool selected = index == items.indexOf(e);
            return DrawerListTile(
              title: e.title!,
              iconData: e.icon!,
              press: e.onTap!,
              selected: selected,
            );
          }),
          ListTileTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 13),
              dense: true,
              child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  childrenPadding: EdgeInsets.zero,
                  initiallyExpanded: false,
                  title: ListTile(
                    title: Text('بيانات اخري'),
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      FontAwesomeIcons.usersCog,
                      size: 14,
                    ).addPaddingOnly(right: 15),
                  ),
                  children: subItems
                      .map(
                        (e) => DrawerListTile(
                          title: e.title,
                          iconData: e.icon,
                          press: () {},
                          selected: false,
                        ),
                      )
                      .toList())),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.press,
    required this.selected,
    this.iconData,
  }) : super(key: key);

  final String? title;
  final VoidCallback press;
  final IconData? iconData;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        size: 14,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
