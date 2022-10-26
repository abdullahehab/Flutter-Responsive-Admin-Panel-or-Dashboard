import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:admin/features/social_status/domain/usecase/add_social_statues_usecase.dart';
import 'package:admin/features/social_status/domain/usecase/get_social_statues_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../widget/components.dart';
import '../../domain/usecase/delete_social_status_usecase.dart';
import '../../domain/usecase/update_social_statues_usecase.dart';
import 'package:collection/collection.dart';

class SocialStatusController extends GetxController with StateMixin {
  SocialStatusController(
      this._getSocialStatuesUseCase,
      this._addSocialStatusUsecase,
      this._updateSocialStatusUsecase,
      this._removeSocialStatuesUseCase);
  GetSocialStatuesUseCase _getSocialStatuesUseCase;
  AddSocialStatusUsecase _addSocialStatusUsecase;
  UpdateSocialStatusUsecase _updateSocialStatusUsecase;
  RemoveSocialStatuesUseCase _removeSocialStatuesUseCase;
  var isLoading = false.obs;

  @override
  void onInit() async {
    await getSocialStatutes(restoreData: false);
    return super.onInit();
  }

  List<SocialStatus> socialStatusList = [];
  getSocialStatutes({required bool restoreData}) async {
    change(null, status: RxStatus.loading());
    var data = await _getSocialStatuesUseCase.execute(restoreData: restoreData);
    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (dataList) {
        if (dataList.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          socialStatusList = dataList;
          change(dataList, status: RxStatus.success());
        }
      },
    );
  }

  addSocialStatutes({required String title}) async {
    change(null, status: RxStatus.loading());
    var data = await _addSocialStatusUsecase.execute(title: title);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الاضافة بنجاح');
        await getSocialStatutes(restoreData: true);
      },
    );
  }

  updateSocialStatutes({required SocialStatus model}) async {
    change(null, status: RxStatus.loading());
    var data = await _updateSocialStatusUsecase.execute(model: model);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم التعديل بنجاح');
        await getSocialStatutes(restoreData: true);
      },
    );
  }

  deleteSocialStatutes({required String id}) async {
    change(null, status: RxStatus.loading());
    var data = await _removeSocialStatuesUseCase.execute(id: id);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الحذف بنجاح');
        await getSocialStatutes(restoreData: true);
      },
    );
  }

  SocialStatus? getById(String id) {
    return socialStatusList
            .firstWhereOrNull((element) => element.id.toString() == id);
  }
}
