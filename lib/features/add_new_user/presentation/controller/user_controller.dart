import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/features/add_new_user/domain/usecase/get_users_usercase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../models/user_model.dart';
import '../../../../widget/components.dart';
import '../../domain/usecase/delete_user_usecase.dart';
import '../../domain/usecase/update_user_usecase.dart';

class UserController extends GetxController with StateMixin<List<UserEntity>> {
  UserController(this._addUserUsecase, this._updateUserUsecase,
      this._getUsersUsecase, this._deleteUserUsecase);
  AddUserUsecase _addUserUsecase;
  DeleteUserUsecase _deleteUserUsecase;
  GetUsersUsecase _getUsersUsecase;
  UpdateUserUsecase _updateUserUsecase;
  var isLoading = false.obs;

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    await getUsers();
    return super.onInit();
  }

  addUser(UserEntity user) async {
    change(null, status: RxStatus.loading());
    var data = await _addUserUsecase.call(user);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) {
        showToast(message: 'تم الاضافة بنجاح');
        getUsers();
      },
    );
  }

  deleteUser(String userId) async {
    change(null, status: RxStatus.loading());
    var data = await _deleteUserUsecase.call(userId);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) {
        showToast(message: 'تم الحذف بنجاح');
        getUsers();
      },
    );
  }

  getUsers() async {
    change(null, status: RxStatus.loading());
    var data = await _getUsersUsecase.call();

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (userList) {
        if (userList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(userList, status: RxStatus.success());
        }
      },
    );
  }

  updateUser(UserEntity user) async {
    change(null, status: RxStatus.loading());
    var data = await _updateUserUsecase.call(user);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) {
        showToast(message: 'تم التعديل بنجاح');
        getUsers();
      },
    );
  }
}
