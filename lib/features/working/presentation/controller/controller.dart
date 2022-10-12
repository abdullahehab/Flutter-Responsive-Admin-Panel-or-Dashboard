import 'package:admin/features/working/domain/usecase/add_work_usecase.dart';
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
    await getWorks();
    return super.onInit();
  }

  getWorks() async {
    change(null, status: RxStatus.loading());
    var data = await _getWorksUseCase.execute();
    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
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
        await getWorks();
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
        await getWorks();
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
        await getWorks();
      },
    );
  }
}
