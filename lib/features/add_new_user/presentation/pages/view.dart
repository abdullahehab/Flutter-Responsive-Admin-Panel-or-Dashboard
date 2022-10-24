import 'package:admin/features/add_new_user/presentation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/shared_components/build_helper_label.dart';
import '../../../../core/shared_components/styled_content_widget.dart';
import '../../../../extensions/extension.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/page_route_name.dart';
import '../../../../widget/main_button.dart';
import '../../../housing/presentation/controller/controller.dart';
import '../../../owning/presentation/controller/controller.dart';
import '../../../social_status/presentation/controller/controller.dart';
import '../../../working/presentation/controller/controller.dart';
import '../../domain/entities/user_entity.dart';
import 'add_user.dart';

class UserView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  final userController = Get.find<UserController>();

  Widget buildBody(UserEntity customer) {
    UserEntity? husbandModel;
    if (!customer.husbandId.toString().isEmptyOrNull()) {
      husbandModel = userController.getById(customer.husbandId!);
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                      buttonColor: AppColor.kPrimaryDarkColor,
                      borderRadius: 6,
                      width: 70,
                      height: 40,
                      buttonPadding: EdgeInsets.zero,
                      text: "رجوع",
                      withoutPadding: true,
                      onPressed: () {
                        Get.back(result: '');
                      }).addPaddingOnly(top: 10, bottom: 10)
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: UserContainer(customer: customer)),
                if (!customer.husbandId.toString().isEmptyOrNull()) ...{
                  Expanded(child: UserContainer(customer: husbandModel!)),
                }
              ],
            )
            // SizedBox(
            //   height: 400,
            //   child: NoteCustomersListView(
            //     customer: customer,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class UserContainer extends StatelessWidget {
  UserContainer({Key? key, required this.customer}) : super(key: key);

  final UserEntity customer;

  final socialStatusController = Get.find<SocialStatusController>();
  final userController = Get.find<UserController>();
  final workController = Get.find<WorkController>();
  final owningController = Get.find<OwningController>();
  final housingController = Get.find<HousingController>();

  String getTitle(bool hasHusband, bool isMale) {
    var title;
    if (!hasHusband) {
      title = 'بيانات الشخص';
      return title;
    }

    if (isMale) {
      title = 'بيانات الزوج';
      return title;
    }
    title = 'بيانات الزوجه';

    return title;
  }

  @override
  Widget build(BuildContext context) {
    return StyledContent(
      title: getTitle(!customer.husbandId.toString().isEmptyOrNull(),
          customer.gender == 'ذكر'),
      children: [
        buildHelperLabel(
          helperText: 'الاسم',
          text: customer.name.toString(),
        ),
        buildHelperLabel(
          helperText: 'الرقم القومي',
          text: customer.nationalId.toString(),
        ),
        buildHelperLabel(
            helperText: 'الحالة الاجتماعية',
            text:
                socialStatusController.getById(customer.socialStatus!)!.title!),
        buildHelperLabel(
            helperText: 'الوظيفة',
            text: workController.getById(customer.working!)!.title!),
        buildHelperLabel(
          helperText: 'العنوان',
          text: customer.address.toString(),
        ),
        buildHelperLabel(
          helperText: 'رقم الهاتف',
          text: customer.phone.toString(),
        ),
        buildHelperLabel(
            helperText: 'الحيازة',
            text: owningController.getById(customer.owning!)!.title!),
        buildHelperLabel(
            helperText: 'السكن',
            text: housingController.getById(customer.housing!)!.title!),
        buildHelperLabel(
            helperText: 'الحالة الصحية',
            text: customer.healthStatus.toString()),
        buildHelperLabel(helperText: 'التمييز', text: customer.type.toString()),
        buildHelperLabel(
            helperText: 'عدد الابناء',
            text: customer.childrenNumber.toString()),
      ],
      footer: customer.husbandId.toString().isEmptyOrNull()
          ? Row(
              children: [
                if (customer.gender == 'ذكر') ...{
                  CustomButton(
                          buttonColor: AppColor.kPrimaryDarkColor,
                          borderRadius: 6,
                          width: 130,
                          height: 40,
                          buttonPadding: EdgeInsets.zero,
                          text: "إضافة ابن / ابنة",
                          withoutPadding: true,
                          onPressed: () {})
                      .addPaddingOnly(top: 10, bottom: 10),
                },
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      CustomButton(
                          buttonColor: AppColor.kPrimaryDarkColor,
                          borderRadius: 6,
                          width: 130,
                          height: 40,
                          buttonPadding: EdgeInsets.zero,
                          text: "إضافة زوج/زوجة",
                          withoutPadding: true,
                          onPressed: () {
                            PeopleDetailsParas params = PeopleDetailsParas(
                                husbandId: customer.nationalId);
                            viewForm(params, customer);
                          }).addPaddingOnly(left: 10, top: 10, bottom: 10),
                    ],
                  ),
                ),
              ],
            )
          : null,
    );
  }

  viewForm(PeopleDetailsParas paras, UserEntity user) async {
    var userController = Get.find<UserController>();
    var husbandId = await showDialog(
          context: Get.context!,
          builder: (_) => AddPeople(
            paras: paras,
          ),
        ) ??
        false;

    if (!husbandId.toString().isEmptyOrNull()) {
      user.husbandId = husbandId;
      await userController.updateUser(user);
      await Future.delayed(const Duration(milliseconds: 400));
      Get.back();
      Get.toNamed(PageRouteName.PEOPLE_DETAILS, arguments: user);
    }
  }
}
