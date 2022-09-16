import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/people_details/people_details.dart';
import 'package:admin/features/add_new_user/presentation/pages/add_user.dart';
import 'package:admin/screens/people_screen/people_screen.dart';
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
            builder: (_) => AddPeople(), settings: settings);

      case PageRouteName.MAIN_SCREEN:
        return MaterialPageRoute<dynamic>(
            builder: (_) => MainScreen(), settings: settings);

      case PageRouteName.PEOPLE_SCREEN:
        return MaterialPageRoute<dynamic>(
            builder: (_) => PeopleScreen(), settings: settings);

      default:
        return MaterialPageRoute<dynamic>(
            builder: (_) => DashboardScreen(), settings: settings);
    }
  }
}
