import 'package:admin/features/working/domain/usecase/add_work_usecase.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../widget/components.dart';
import '../../domain/entities/work.dart';
import '../../domain/usecase/delete_work_usecase.dart';
import '../../domain/usecase/get_works_usecase.dart';
import '../../domain/usecase/update_work_usecase.dart';

class WorkController extends GetxController with StateMixin {
  WorkController(this._getWorksUseCase, this._addWorkUsecase,
      this._updateWorkUsecase, this._removeWorkUseCase);
  GetWorksUseCase _getWorksUseCase;
  AddWorkUsecase _addWorkUsecase;
  UpdateWorkUsecase _updateWorkUsecase;
  RemoveWorkUseCase _removeWorkUseCase;
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getWorks(restoreData: false);
    return super.onInit();
  }

  List<Work> workList = [];
  getWorks({required bool restoreData}) async {
    change(null, status: RxStatus.loading());
    var data = await _getWorksUseCase.execute(restoreData: restoreData);
    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          workList = dataList;
          change(dataList, status: RxStatus.success());
        }
      },
    );
  }

  addWork({required String title}) async {
    change(null, status: RxStatus.loading());
    var data = await _addWorkUsecase.execute(title: title);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الاضافه بنجاح');
        await getWorks(restoreData: true);
      },
    );
  }

  updateWork({required Work model}) async {
    change(null, status: RxStatus.loading());
    var data = await _updateWorkUsecase.execute(model: model);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم التعديل بنجاح');
        await getWorks(restoreData: true);
      },
    );
  }

  deleteWork({required String id}) async {
    change(null, status: RxStatus.loading());
    var data = await _removeWorkUseCase.execute(id: id);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الحذف بنجاح');
        await getWorks(restoreData: true);
      },
    );
  }

  String? getById(String id) {
    return workList
            .firstWhereOrNull((element) => element.id.toString() == id)
            ?.title ??
        '';
  }
}
