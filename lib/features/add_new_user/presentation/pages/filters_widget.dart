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
import '../../../../widget/main_button.dart';
import '../../../housing/domain/entities/housing.dart';
import '../../../housing/presentation/controller/controller.dart';
import '../../../owning/domain/entities/owning.dart';
import '../../../owning/presentation/controller/controller.dart';
import '../../../social_status/domain/entities/social_status.dart';
import '../../../social_status/presentation/controller/controller.dart';
import '../../../working/domain/entities/work.dart';
import '../../../working/presentation/controller/controller.dart';

class FilterModel {
  String? name;
  String? nationalId;
  String? work;
  String? owning;
  String? housing;
  String? socialStatus;
}

class FilterForm extends GetView<UserController> {
  FilterForm({Key? key}) : super(key: key);

  final socialStatusController = Get.find<SocialStatusController>();
  final workController = Get.find<WorkController>();
  final owningController = Get.find<OwningController>();
  final housingController = Get.find<HousingController>();

  final nameController = TextEditingController();
  final nationalIdController = TextEditingController();

  FilterModel filterModel = FilterModel();
  @override
  Widget build(BuildContext context) {
    return StyledContent(
      title: "خيارات التصنيف",
      titleWidget: CustomButton(
          width: 200,
          height: 50,
          forwardButton: Icon(Icons.refresh).paddingOnly(left: 5),
          text: 'إعادة تحميل الاشخاص',
          onPressed: () {
            nameController.clear();
            nationalIdController.clear();


            controller.reset();
          }),
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      prefixIcon:
                          Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                      contentPadding: EdgeInsets.only(right: 10),
                      onChangedText: (String text) {
                        filterModel.name = text;
                        controller.filterUsers(filterModel);
                      },
                      hint: 'الاسم',
                      outLineText: 'الاسم',
                      iconPathWidth: 17,
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: CustomTextField(
                      contentPadding: EdgeInsets.only(right: 10),
                      prefixIcon: Icon(FontAwesomeIcons.addressBook,
                          size: APP_ICON_SIZE),
                      onChangedText: (String text) {
                        filterModel.nationalId = text;
                        controller.filterUsers(filterModel);
                      },
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
                      maxHeight: 300,
                      items: workController.workList,
                      onChanged: (value) {
                        var selected = value as Work;
                        filterModel.work = selected.id.toString();
                        controller.filterUsers(filterModel);
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
                      maxHeight: 300,
                      items: owningController.owningList,
                      onChanged: (value) {
                        var selected = value as Owning;
                        filterModel.owning = selected.id.toString();
                        controller.filterUsers(filterModel);
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
                    maxHeight: 300,
                    items: housingController.housingList,
                    onChanged: (value) {
                      var selected = value as Housing;
                      filterModel.housing = selected.id.toString();
                      controller.filterUsers(filterModel);
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
                      maxHeight: 300,
                      items: socialStatusController.socialStatusList,
                      onChanged: (value) {
                        var selected = value as SocialStatus;
                        filterModel.socialStatus = selected.id.toString();
                        controller.filterUsers(filterModel);
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
