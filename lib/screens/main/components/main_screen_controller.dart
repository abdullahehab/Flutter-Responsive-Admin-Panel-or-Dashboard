import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/constants/constants.dart';

class MainScreenController extends GetxController {
  var _selectedMenuIndex = 0.obs;
  int get selectedMenuIndex => _selectedMenuIndex.value;
  set setSelectedMenuIndex(int newVlu) {
    _selectedMenuIndex.value = newVlu;
  }

  var _selectedKey = HOME_KEY.obs;
  Widget? get selectedWidget => namedPages[_selectedKey.value];
  set setSelectedKey(String newVlu) {
    _selectedKey.value = newVlu;
  }
}
