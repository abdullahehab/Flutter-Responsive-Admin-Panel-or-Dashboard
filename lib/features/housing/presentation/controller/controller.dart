import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../widget/components.dart';
import '../../domain/entities/housing.dart';
import '../../domain/usecase/add_housing_usecase.dart';
import '../../domain/usecase/delete_housing_usecase.dart';
import '../../domain/usecase/get_housings_usecase.dart';
import '../../domain/usecase/update_housing_usecase.dart';

class HousingController extends GetxController with StateMixin {
  HousingController(this._getHousingsUseCase, this._addHousingUsecase,
      this._updateHousingUsecase, this._removeHousingUseCase);
  GetHousingsUseCase _getHousingsUseCase;
  AddHousingUsecase _addHousingUsecase;
  UpdateHousingUsecase _updateHousingUsecase;
  RemoveHousingUseCase _removeHousingUseCase;
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getHousings(restoreData: false);
    return super.onInit();
  }

  List<Housing> housingList = [];
  getHousings({required bool restoreData}) async {
    change(null, status: RxStatus.loading());
    var data = await _getHousingsUseCase.execute(restoreData: restoreData);
    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          housingList = dataList;
          change(dataList, status: RxStatus.success());
        }
      },
    );
  }

  addHousing({required String title}) async {
    change(null, status: RxStatus.loading());
    var data = await _addHousingUsecase.execute(title: title);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الاضافه بنجاح');
        await getHousings(restoreData: true);
      },
    );
  }

  updateHousing({required Housing model}) async {
    change(null, status: RxStatus.loading());
    var data = await _updateHousingUsecase.execute(model: model);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم التعديل بنجاح');
        await getHousings(restoreData: true);
      },
    );
  }

  deleteHousing({required String id}) async {
    change(null, status: RxStatus.loading());
    var data = await _removeHousingUseCase.execute(id: id);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الحذف بنجاح');
        await getHousings(restoreData: true);
      },
    );
  }
}
