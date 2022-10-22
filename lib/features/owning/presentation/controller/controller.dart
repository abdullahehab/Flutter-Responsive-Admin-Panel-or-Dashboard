import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../widget/components.dart';
import '../../domain/entities/owning.dart';
import '../../domain/usecase/add_owning_usecase.dart';
import '../../domain/usecase/delete_owning_usecase.dart';
import '../../domain/usecase/get_housings_usecase.dart';
import '../../domain/usecase/update_owning_usecase.dart';

class OwningController extends GetxController with StateMixin {
  OwningController(this._getOwningUseCase, this._addOwningUsecase,
      this._updateOwningUsecase, this._removeOwningUseCase);
  GetOwningUseCase _getOwningUseCase;
  AddOwningUsecase _addOwningUsecase;
  UpdateOwningUsecase _updateOwningUsecase;
  RemoveOwningUseCase _removeOwningUseCase;
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getOwning(restoreData: false);
    return super.onInit();
  }

  List<Owning> owningList = [];
  getOwning({required bool restoreData}) async {
    change(null, status: RxStatus.loading());
    var data = await _getOwningUseCase.execute(restoreData: restoreData);
    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          owningList = dataList;
          change(dataList, status: RxStatus.success());
        }
      },
    );
  }

  addOwning({required String title}) async {
    change(null, status: RxStatus.loading());
    var data = await _addOwningUsecase.execute(title: title);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الاضافة بنجاح');
        await getOwning(restoreData: true);
      },
    );
  }

  updateOwning({required Owning model}) async {
    change(null, status: RxStatus.loading());
    var data = await _updateOwningUsecase.execute(model: model);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم التعديل بنجاح');
        await getOwning(restoreData: true);
      },
    );
  }

  deleteOwning({required String id}) async {
    change(null, status: RxStatus.loading());
    var data = await _removeOwningUseCase.execute(id: id);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الحذف بنجاح');
        await getOwning(restoreData: true);
      },
    );
  }

  String? getById(String id) {
    return owningList
        .firstWhereOrNull((element) => element.id.toString() == id)
        ?.title ??
        '';
  }
}
