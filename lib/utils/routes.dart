import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/people_details/people_details.dart';
import 'package:admin/screens/people_new/people_new.dart';
import 'package:admin/utils/page_route_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case PageRouteName.DETAILS:
        return MaterialPageRoute<dynamic>(
            builder: (_) => PeopleDetails(), settings: settings);

      case PageRouteName.ADD_NEW:
        return MaterialPageRoute<dynamic>(
            builder: (_) => NewPeople(), settings: settings);

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => DashboardScreen(), settings: settings);
    }
  }
}
