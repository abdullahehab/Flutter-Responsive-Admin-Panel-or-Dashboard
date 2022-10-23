import 'package:admin/utils/page_route_name.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../features/add_new_user/presentation/pages/add_user.dart';
import '../features/add_new_user/presentation/pages/view.dart';
import '../screens/main/main_screen.dart';
import '../screens/people_details/people_details.dart';
import '../screens/people_screen/people_screen.dart';

class AppPages {
  AppPages._();

  static const INITIAL = PageRouteName.MAIN_SCREEN;

  static final routes = [
    GetPage(
      name: PageRouteName.MAIN_SCREEN,
      page: () => MainScreen(),
    ),
    GetPage(
      name: PageRouteName.DETAILS,
      page: () => PeopleDetails(),
    ),
    GetPage(
      name: PageRouteName.ADD_NEW,
      page: () => AddPeople(),
    ),
    GetPage(
      name: PageRouteName.PEOPLE_SCREEN,
      page: () => PeopleScreen(),
    ),
    GetPage(
      name: PageRouteName.PEOPLE_DETAILS,
      page: () => UserView(),
    ),
  ];
}
