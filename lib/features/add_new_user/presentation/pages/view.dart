import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared_components/build_helper_label.dart';
import '../../../../core/shared_components/styled_content_widget.dart';
import '../../../../utils/colors.dart';
import '../../../../widget/main_button.dart';
import '../../../housing/presentation/controller/controller.dart';
import '../../../owning/presentation/controller/controller.dart';
import '../../../social_status/presentation/controller/controller.dart';
import '../../../working/presentation/controller/controller.dart';
import '../../domain/entities/user_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../extensions/extension.dart';

class UserView extends GetView {
  @override
  Widget build(BuildContext context) {
    return buildBody(Get.arguments);
  }

  var socialStatusController = Get.find<SocialStatusController>();
  var workController = Get.find<WorkController>();
  var owningController = Get.find<OwningController>();
  var housingController = Get.find<HousingController>();

  Widget buildBody(UserEntity customer) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: StyledContent(
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
                          text: socialStatusController
                              .getById(customer.socialStatus!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'الوظيفة',
                          text: workController
                              .getById(customer.working!)!
                              .title!),
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
                          text: owningController
                              .getById(customer.owning!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'السكن',
                          text: housingController
                              .getById(customer.housing!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'الحالة الصحية',
                          text: customer.healthStatus.toString()),
                      buildHelperLabel(
                          helperText: 'التمييز',
                          text: customer.type.toString()),
                      buildHelperLabel(
                          helperText: 'عدد الابناء',
                          text: customer.childrenNumber.toString()),
                    ],
                    footer: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          if (customer.husbandId
                              .toString()
                              .isEmptyOrNull()) ...{
                            CustomButton(
                                    buttonColor: AppColor.kPrimaryDarkColor,
                                    borderRadius: 6,
                                    width: 130,
                                    height: 40,
                                    buttonPadding: EdgeInsets.zero,
                                    text: "إضافة زوج/زوجة",
                                    withoutPadding: true,
                                    onPressed: () {})
                                .addPaddingOnly(left: 10, top: 10, bottom: 10),
                          },
                          CustomButton(
                                  buttonColor: AppColor.kPrimaryDarkColor,
                                  borderRadius: 6,
                                  width: 130,
                                  height: 40,
                                  buttonPadding: EdgeInsets.zero,
                                  text: "إضافة ابن / ابنة",
                                  withoutPadding: true,
                                  onPressed: () {})
                              .addPaddingOnly(left: 10, top: 10, bottom: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                if (!customer.husbandId.toString().isEmptyOrNull()) ...{
                  Expanded(
                    child: StyledContent(children: [
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
                          text: socialStatusController
                              .getById(customer.socialStatus!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'الوظيفة',
                          text: workController
                              .getById(customer.working!)!
                              .title!),
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
                          text: owningController
                              .getById(customer.owning!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'السكن',
                          text: housingController
                              .getById(customer.housing!)!
                              .title!),
                      buildHelperLabel(
                          helperText: 'الحالة الصحية',
                          text: customer.healthStatus.toString()),
                      buildHelperLabel(
                          helperText: 'التمييز',
                          text: customer.type.toString()),
                      buildHelperLabel(
                          helperText: 'عدد الابناء',
                          text: customer.childrenNumber.toString()),
                    ]),
                  ),
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
