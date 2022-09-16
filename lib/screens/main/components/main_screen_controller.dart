import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainScreenController extends GetxController {
  var _selectedMenuIndex = 0.obs;
  int get selectedMenuIndex => _selectedMenuIndex.value;
  set setSelectedMenuIndex(int newVlu) {
    _selectedMenuIndex.value = newVlu;
  }
}
