import 'package:admin/features/add_new_user/presentation/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/shared_components/drop_down_widget.dart';
import '../../../../core/shared_components/styled_content_widget.dart';
import '../../../../utils/text_field_validator.dart';
import '../../../../widget/custom_text_field.dart';
import '../../../housing/domain/entities/housing.dart';
import '../../../housing/presentation/controller/controller.dart';
import '../../../owning/domain/entities/owning.dart';
import '../../../owning/presentation/controller/controller.dart';
import '../../../social_status/domain/entities/social_status.dart';
import '../../../social_status/presentation/controller/controller.dart';
import '../../../working/domain/entities/work.dart';
import '../../../working/presentation/controller/controller.dart';

class FilterForm extends GetView<UserController> {
   FilterForm({Key? key}) : super(key: key);

  final socialStatusController = Get.find<SocialStatusController>();
  final workController = Get.find<WorkController>();
  final owningController = Get.find<OwningController>();
  final housingController = Get.find<HousingController>();

  @override
  Widget build(BuildContext context) {
    return StyledContent(
      title: "خيارات التصنيف",
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      validator: TextFieldValidators.isName,
                      prefixIcon:
                          Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                      contentPadding: EdgeInsets.only(right: 10),
                      // onChangedText: (String text) => userModel.name = text,
                      // initialValue: userModel.name,
                      hint: 'الاسم',
                      outLineText: 'الاسم',
                      iconPathWidth: 17,
                      textInputType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: CustomTextField(
                      validator: TextFieldValidators.isPhone,
                      contentPadding: EdgeInsets.only(right: 10),
                      prefixIcon: Icon(FontAwesomeIcons.addressBook,
                          size: APP_ICON_SIZE),
                      // onChangedText: (String text) => userModel.phone = text,
                      // initialValue: userModel.phone,
                      hint: 'الرقم القومي',
                      outLineText: 'الرقم القومي',
                      iconPathWidth: 17,
                      maxLength: 11,
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: DropDownWidgetX<Work>(
                      requiredFiled: true,
                      labelText: 'الوظيفة',
                      // selectedItem: workController.getById(userModel.working!),
                      itemAsString: (Work? u) => u!.title!,
                      maxHeight: 100,
                      items: workController.workList,
                      onChanged: (value) {
                        var selected = value as Work;
                        // userModel.working = selected.id.toString();
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: DropDownWidgetX<Owning>(
                      requiredFiled: true,
                      labelText: 'الحيازة',
                      // selectedItem: owningController.getById(userModel.owning!),
                      itemAsString: (Owning? u) => u!.title!,
                      maxHeight: 100,
                      items: owningController.owningList,
                      onChanged: (value) {
                        var selected = value as Owning;
                        // userModel.owning = selected.id.toString();
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                      child: DropDownWidgetX<Housing>(
                    requiredFiled: true,
                    labelText: 'السكن',
                    // selectedItem: housingController.getById(userModel.housing!),
                    itemAsString: (Housing? u) => u!.title!,
                    maxHeight: 100,
                    items: housingController.housingList,
                    onChanged: (value) {
                      var selected = value as Housing;
                      // userModel.housing = selected.id.toString();
                    },
                  )),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: DropDownWidgetX<SocialStatus>(
                      requiredFiled: true,
                      labelText: 'الحالة الاجتماعية',
                      // selectedItem:
                      // socialStatusController.getById(userModel.socialStatus!),
                      itemAsString: (SocialStatus? u) => u!.title!,
                      maxHeight: 100,
                      items: socialStatusController.socialStatusList,
                      onChanged: (value) {
                        var selected = value as SocialStatus;
                        // userModel.socialStatus = selected.id.toString();
                      },
                    ),
                  ),
                  SizedBox(width: 2.w),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
