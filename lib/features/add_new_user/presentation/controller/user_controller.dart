import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../models/user_model.dart';
import '../../../../widget/components.dart';
class UserController extends GetxController with StateMixin {
  UserController(this._addUserUsecase);
  AddUserUsecase _addUserUsecase;
  var isLoading = false.obs;


  addUser(UserModel user) async {
    var data = await _addUserUsecase.call(user);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) {
        showToast(message: 'تم الاضافه بنجاح');
      },
    );
  }
}
