import 'package:admin/features/social_status/domain/usecase/add_social_statues_usecase.dart';
import 'package:admin/features/social_status/domain/usecase/get_social_statues_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../widget/components.dart';

class SocialStatusController extends GetxController with StateMixin {
  SocialStatusController(
      this._getSocialStatuesUseCase, this._addSocialStatusUsecase);
  GetSocialStatuesUseCase _getSocialStatuesUseCase;
  AddSocialStatusUsecase _addSocialStatusUsecase;
  var isLoading = false.obs;

  @override
  void onReady() async {
    await getSocialStatutes();
    return super.onInit();
  }

  getSocialStatutes() async {
    var data = await _getSocialStatuesUseCase.execute();
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

  addSocialStatutes({required String title}) async {
    var data = await _addSocialStatusUsecase.execute(title: title);

    data.fold(
      (failure) {
        showToast(message: failure.mess);
      },
      (done) async {
        showToast(message: 'تم الاضافه بنجاح');
        await getSocialStatutes();
      },
    );
  }
}
