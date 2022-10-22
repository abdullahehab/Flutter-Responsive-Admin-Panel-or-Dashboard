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
    print('Get.arguments => ${Get.arguments}');
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
        gender: '',
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

                controller.addUser(userModel);
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
                  labelText: 'الحاله الاجتماعيه',
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
                  labelText: 'الوظيفه',
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
                  // initialValue: customerModels.value.idExpireDate,
                  firstDate: DateTime.now().year,
                  onSaved: (value) => userModel.birthDate = value,
                ),
                SizedBox(height: 10),
                DropDownWidgetX<String>(
                  maxHeight: 100,
                  labelText: 'الحالة الصحية',
                  items: healthKeys,
                  selectedItem: healthKeys.last,
                  onChanged: (value) => userModel.healthStatus = value,
                ),
                SizedBox(height: 10),
                DropDownWidgetX<String>(
                  maxHeight: 100,
                  labelText: 'تمميز الحاله',
                  items: typeKeys,
                  selectedItem: typeKeys.last,
                  onChanged: (value) => userModel.type = value,
                ),
                SizedBox(
                  height: 10,
                ),
                GenderSelector(
                  outLineText: 'النوع',
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
