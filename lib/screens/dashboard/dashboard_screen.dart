import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/my_fields.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../core/constants/constants.dart';
import 'components/recent_files.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kMainBackgroundColor,
      drawer: Responsive.isMobile() ? Drawer(child: SideMenu()) : null,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'الرئيسية',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Summary(),
                        SizedBox(height: defaultPadding),
                        RecentFiles(),
                        if (Responsive.isMobile())
                          SizedBox(height: defaultPadding),
                        // if (Responsive.isMobile(context)) LoggedInUserDetails(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile())
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  // if (!Responsive.isMobile(context))
                  //   Expanded(
                  //     flex: 2,
                  //     child: LoggedInUserDetails(),
                  //   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
