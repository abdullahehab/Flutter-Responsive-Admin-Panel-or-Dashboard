import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/features/add_new_user/domain/usecase/add_user_usecase.dart';
import 'package:admin/features/add_new_user/domain/usecase/get_users_usercase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:admin/extensions/extension.dart';
import '../../../../models/user_model.dart';
import '../../../../widget/components.dart';
import '../../domain/usecase/delete_user_usecase.dart';
import '../../domain/usecase/update_user_usecase.dart';
import '../pages/filters_widget.dart';

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
        showToast(message: 'تم الإضافة بنجاح');
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

  List<UserEntity> users = [];
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
          users = userList;
          change(userList, status: RxStatus.success());
        }
      },
    );
  }

  filterUsers(FilterModel filterModel) {
    var filteredList = users.where((user) {
      if (filterModel.name.toString().isEmptyOrNull()) return true;

      return user.name!.toLowerCase().contains(filterModel.name!.toLowerCase());
    }).where((user) {
      if (filterModel.nationalId.toString().isEmptyOrNull()) return true;

      return user.nationalId!
          .toString()
          .contains(filterModel.nationalId!.toString());
    }).where((user) {
      if (filterModel.work.toString().isEmptyOrNull()) return true;

      return user.working!.toString().contains(filterModel.work!.toString());
    }).where((user) {
      if (filterModel.owning.toString().isEmptyOrNull()) return true;

      return user.owning!.toString().contains(filterModel.owning!.toString());
    }).where((user) {
      if (filterModel.housing.toString().isEmptyOrNull()) return true;

      return user.housing!.toString().contains(filterModel.housing!.toString());
    }).where((user) {
      if (filterModel.socialStatus.toString().isEmptyOrNull()) return true;

      return user.socialStatus!
          .toString()
          .contains(filterModel.socialStatus!.toString());
    }).toList();

    change(filteredList, status: RxStatus.success());
  }

  void reset() {
    change(users, status: RxStatus.success());
  }

  Future updateUser(UserEntity user, {Function()? onSuccess}) async {
    change(null, status: RxStatus.loading());
    var data = await _updateUserUsecase.call(user);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) {
        showToast(message: 'تم التعديل بنجاح');
        getUsers();
        onSuccess?.call();
      },
    );
  }

  UserEntity? getById(String id) {
    return users
        .firstWhereOrNull((element) => element.nationalId.toString() == id);
  }
}
