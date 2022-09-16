import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserController extends GetxController {
  UserController(this.addUserUsecase);
  AddUserUsecase addUserUsecase;
  var isLoading = false.obs;

}
