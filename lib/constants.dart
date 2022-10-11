import 'package:admin/features/add_new_user/presentation/pages/add_user.dart';
import 'package:admin/screens/dashboard/dashboard_screen.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:admin/screens/people_screen/people_screen.dart';
import 'package:admin/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const double APP_BORDER_RADIUS = 5;
const defaultPadding = 16.0;

TextStyle tableDataStyle =
    Theme.of(Get.context!).textTheme.bodyText2!.copyWith(color: Colors.black54);

const double APP_ICON_SIZE = 15;

const List<String> genderKeys = <String>['ذكر', 'انثي'];
const List<String> statusKeys = <String>['اعزب', 'متزوج'];
const List<String> healthKeys = <String>['مريض', 'سليم'];

const String HOME_KEY = "home";
const String USERS_KEY = "users";
const String ADD_USER_KEY = "addUser";

Map<String, Widget> namedPages = {
  HOME_KEY: DashboardScreen(),
  USERS_KEY: PeopleScreen(),
  ADD_USER_KEY: AddPeople(),
};
const kTextFiledBorderRadius = 5.0;
const String egPhoneRegex = r'(010|011|012|015)[0-9]{8}$';
