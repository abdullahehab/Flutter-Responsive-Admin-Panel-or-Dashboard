import 'package:admin/services/service_locator.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const double APP_BORDER_RADIUS = 5;
const defaultPadding = 16.0;

TextStyle tableDataStyle = Theme.of(sL<BuildContext>())
    .textTheme
    .bodyText2!
    .copyWith(color: Colors.black54);

const double APP_ICON_SIZE = 15;

const List<String> genderKeys = <String>['ذكر', 'انثي'];
const List<String> statusKeys = <String>['اعزب', 'متزوج'];
const List<String> healthKeys = <String>['مريض', 'سليم'];

const String egPhoneRegex = r'(010|011|012|015)[0-9]{8}$';
