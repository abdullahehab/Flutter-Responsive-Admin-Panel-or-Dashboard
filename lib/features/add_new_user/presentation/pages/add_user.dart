import 'package:admin/extensions/extension.dart';
import 'package:admin/features/add_new_user/presentation/controller/user_controller.dart';
import 'package:admin/features/housing/presentation/controller/controller.dart';
import 'package:admin/features/owning/data/models/owning_model.dart';
import 'package:admin/features/owning/presentation/controller/controller.dart';
import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:admin/features/social_status/presentation/controller/controller.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/widget/custom_text_field.dart';
import 'package:admin/widget/gender_selector.dart';
import 'package:admin/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/shared_components/build_date_time_picker_field.dart';
import '../../../../core/shared_components/drop_down_widget.dart';
import '../../../../models/user_model.dart';
import '../../../../screens/main/components/main_screen_controller.dart';
import '../../../../utils/text_field_validator.dart';
import '../../../housing/domain/entities/housing.dart';
import '../../../owning/domain/entities/owning.dart';
import '../../../working/domain/entities/work.dart';
import '../../../working/presentation/controller/controller.dart';

class AddPeople extends GetView<UserController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mainScreenController = Get.find<MainScreenController>();
    var owningController = Get.find<OwningController>();
    var housingController = Get.find<HousingController>();
    var socialStatusController = Get.find<SocialStatusController>();
    var workController = Get.find<WorkController>();
    bool isEdit = false;
    UserModel userModel;
    if (Get.arguments == null) {
      userModel = UserModel(
        nationalId: '',
        name: '',
        address: '',
        husbandId: '',
        socialStatus: 'اعزب',
        birthDate: null,
        phone: '',
        working: '',
        healthStatus: 'غير مريض',
        type: 'سليم',
        childrenNumber: null,
        parentId: '',
        housing: '',
        gender: 'ذكر',
        owning: '',
      );
    } else {
      isEdit = true;

      userModel = Get.arguments as UserModel;
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: CustomButton(
              buttonColor: AppColor.kPrimaryDarkColor,
              borderRadius: 6,
              width: 70,
              height: 40,
              buttonPadding: EdgeInsets.zero,
              text: "حفظ",
              withoutPadding: true,
              onPressed: () {
                if (_formKey.currentState!.validate() == false) {
                  return;
                }
                _formKey.currentState!.save();

                if(isEdit) {
                  controller.updateUser(userModel);
                  Get.back();
                  return;
                }

                controller.addUser(userModel);
                Get.back();
              }).addPaddingOnly(left: 10, top: 10, bottom: 10),
          centerTitle: false,
          actions: [
            CustomButton(
                buttonColor: AppColor.kPrimaryDarkColor,
                borderRadius: 6,
                width: 70,
                height: 40,
                buttonPadding: EdgeInsets.zero,
                text: "رجوع",
                withoutPadding: true,
                onPressed: () {
                  Get.back();
                }).addPaddingOnly(left: 10, top: 10, bottom: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                CustomTextField(
                  validator: TextFieldValidators.isName,
                  prefixIcon: Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                  contentPadding: EdgeInsets.only(right: 10),
                  onChangedText: (String text) => userModel.name = text,
                  initialValue: userModel.name,
                  hint: 'الاسم',
                  outLineText: 'الاسم',
                  iconPathWidth: 17,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  validator: TextFieldValidators.isAddress,
                  contentPadding: EdgeInsets.only(right: 10),
                  prefixIcon:
                      Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
                  onChangedText: (String text) => userModel.address = text,
                  hint: 'العنوان',
                  initialValue: userModel.address,
                  outLineText: 'العنوان',
                  iconPathWidth: 17,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  validator: TextFieldValidators.isPhone,
                  contentPadding: EdgeInsets.only(right: 10),
                  prefixIcon:
                      Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
                  onChangedText: (String text) => userModel.phone = text,
                  initialValue: userModel.phone,
                  hint: 'رقم الهاتف',
                  outLineText: 'رقم الهاتف',
                  iconPathWidth: 17,
                  textInputType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  validator: TextFieldValidators.isNationalId,
                  contentPadding: EdgeInsets.only(right: 10),
                  prefixIcon:
                      Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
                  onChangedText: (String text) => userModel.nationalId = text,
                  initialValue: userModel.nationalId,
                  hint: 'الرقم القومي',
                  outLineText: 'الرقم القومي',
                  iconPathWidth: 17,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),
                DropDownWidgetX<Owning>(
                  requiredFiled: true,
                  labelText: 'الحيازة',
                  selectedItem: owningController.getById(userModel.owning!),
                  itemAsString: (Owning? u) => u!.title!,
                  maxHeight: 100,
                  items: owningController.owningList,
                  onChanged: (value) {
                    var selected = value as Owning;
                    userModel.owning = selected.id.toString();
                  },
                ),
                SizedBox(height: 10),
                DropDownWidgetX<Housing>(
                  requiredFiled: true,
                  labelText: 'السكن',
                  selectedItem: housingController.getById(userModel.housing!),
                  itemAsString: (Housing? u) => u!.title!,
                  maxHeight: 100,
                  items: housingController.housingList,
                  onChanged: (value) {
                    var selected = value as Housing;
                    userModel.housing = selected.id.toString();
                  },
                ),
                SizedBox(height: 10),
                DropDownWidgetX<SocialStatus>(
                  requiredFiled: true,
                  labelText: 'الحالة الاجتماعية',
                  selectedItem:
                      socialStatusController.getById(userModel.socialStatus!),
                  itemAsString: (SocialStatus? u) => u!.title!,
                  maxHeight: 100,
                  items: socialStatusController.socialStatusList,
                  onChanged: (value) {
                    var selected = value as SocialStatus;
                    userModel.socialStatus = selected.id.toString();
                  },
                ),
                SizedBox(height: 10),
                DropDownWidgetX<Work>(
                  requiredFiled: true,
                  labelText: 'الوظيفة',
                  selectedItem: workController.getById(userModel.working!),
                  itemAsString: (Work? u) => u!.title!,
                  maxHeight: 100,
                  items: workController.workList,
                  onChanged: (value) {
                    var selected = value as Work;
                    userModel.working = selected.id.toString();
                  },
                ),
                SizedBox(height: 10),
                buildDateTimePickerField(
                  labelText: 'تاريخ الميلاد',
                  initialValue: userModel.birthDate,
                  firstDate: DateTime.now().year,
                  onSaved: (value) => userModel.birthDate = value,
                ),
                SizedBox(height: 10),
                DropDownWidgetX<String>(
                  maxHeight: 100,
                  labelText: 'الحالة الصحية',
                  items: healthKeys,
                  selectedItem: userModel.healthStatus ?? healthKeys.last,
                  onChanged: (value) => userModel.healthStatus = value,
                ),
                SizedBox(height: 10),
                DropDownWidgetX<String>(
                  maxHeight: 100,
                  labelText: 'تمميز الحالة',
                  items: typeKeys,
                  selectedItem: userModel.type ?? typeKeys.last,
                  onChanged: (value) => userModel.type = value,
                ),
                SizedBox(
                  height: 10,
                ),
                GenderSelector(
                  outLineText: 'النوع',
                  initValue: userModel.gender,
                  onChanged: (newValue) => userModel.gender = newValue,
                ),
              ],
            ).addPaddingOnly(bottom: context.mediaQueryPadding.bottom),
          ),
        ).addPaddingHorizontalVertical(horizontal: 16));
  }
}

class HorizontalLabeledWidget extends StatelessWidget {
  const HorizontalLabeledWidget(
      {Key? key, required this.child, required this.label})
      : super(key: key);

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 27.w,
          child: Text(
            '${label} : ',
            style: TextStyle(
              fontSize: 16,
              height: 1,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: SizedBox(
            child: child,
          ),
        ),
      ],
    );
  }
}
