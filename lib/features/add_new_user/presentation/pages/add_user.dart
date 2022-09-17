import 'package:admin/extensions/extension.dart';
import 'package:admin/features/add_new_user/presentation/controller/user_controller.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/utils/text_field_validator.dart';
import 'package:admin/widget/app_drop_down.dart';
import 'package:admin/widget/custom_text_field.dart';
import 'package:admin/widget/date_selector.dart';
import 'package:admin/widget/gender_selector.dart';
import 'package:admin/widget/get_date_from_picker_dialog.dart';
import 'package:admin/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../core/shared_components/build_date_time_picker_field.dart';
import '../../../../core/shared_components/drop_down_widget.dart';
import '../../../../models/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPeople extends GetView<UserController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    UserModel userModel;
    if (Get.arguments == null) {
      userModel = UserModel();
    } else {
      isEdit = true;
      userModel = Get.arguments as UserModel;
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            CustomButton(
                buttonColor: AppColor.kPrimaryDarkColor,
                borderRadius: 6,
                width: 70,
                buttonPadding: EdgeInsets.zero,
                text: "tes",
                withoutPadding: true,
                onPressed: () => print('test')
                // Navigator.pushNamed(context, PageRouteName.DONE),
                ).addPaddingOnly(left: 10, top: 10, bottom: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'الاسم',
                  child: CustomTextField(
                    prefixIcon:
                        Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                    contentPadding: EdgeInsets.only(right: 10),
                    onChangedText: (String text) => userModel.name = text,
                    hint: 'الاسم',
                    iconPathWidth: 17,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'العنوان',
                  child: CustomTextField(
                    contentPadding: EdgeInsets.only(right: 10),
                    prefixIcon:
                        Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
                    onChangedText: (String text) => userModel.address = text,
                    hint: 'العنوان',
                    iconPathWidth: 17,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'الرقم القومي',
                  child: CustomTextField(
                    contentPadding: EdgeInsets.only(right: 10),
                    prefixIcon:
                        Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
                    onChangedText: (String text) => userModel.nationalId = text,
                    hint: 'الرقم القومي',
                    iconPathWidth: 17,
                    textInputType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'حيازه',
                  child: CustomTextField(
                    contentPadding: EdgeInsets.only(right: 10),
                    prefixIcon:
                        Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
                    // borderColor: AppColor.BORDER_COLOR,
                    onChangedText: (String text) => userModel.phone = text,
                    hint: 'حيازه',
                    iconPathWidth: 17,
                    textInputType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'الحالة الاجتماعية',
                  child: DropDownWidgetX(
                    maxHeight: 100,
                    items: statusKeys,
                    selectedItem: statusKeys.first,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'الوظيفه',
                  child: CustomTextField(
                    contentPadding: EdgeInsets.only(right: 10),
                    prefixIcon:
                        Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
                    onChangedText: (String text) => userModel.working = text,
                    hint: 'الوظيفه',
                    iconPathWidth: 17,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'تاريخ الميلاد',
                  child: buildDateTimePickerField(
                    // initialValue: customerModels.value.idExpireDate,
                    firstDate: DateTime.now().year,
                    onSaved: (value) {},
                  ),
                ),
                SizedBox(height: 10),
                HorizontalLabeledWidget(
                  label: 'الحالة الصحية',
                  child: DropDownWidgetX(
                    maxHeight: 100,
                    items: healthKeys,
                    selectedItem: healthKeys.first,
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                HorizontalLabeledWidget(
                  label: 'النوع',
                  child: GenderSelector(
                    onChanged: (newValue) {
                      print('new => $newValue');
                    },
                  ),
                ),
              ],
            ).addPaddingOnly(bottom: context.mediaQueryPadding.bottom),
          ),
        ).addPaddingHorizontalVertical(horizontal: 16));
  }
}

Widget husbandForm(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("بيانات الزوج/ الزوجه", style: Theme.of(context).textTheme.headline6)
          .addPaddingOnly(right: 20),
      SizedBox(height: 10),
      CustomTextField(
        prefixIcon: Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
        contentPadding: EdgeInsets.only(right: 10),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'الاسم',
        hint: 'الاسم',
        iconPathWidth: 17,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      CustomTextField(
        contentPadding: EdgeInsets.only(right: 10),
        prefixIcon: Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'العنوان',
        hint: 'العنوان',
        iconPathWidth: 17,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      CustomTextField(
        contentPadding: EdgeInsets.only(right: 10),
        prefixIcon: Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'الرقم القومي',
        hint: 'الرقم القومي',
        iconPathWidth: 17,
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      CustomTextField(
        contentPadding: EdgeInsets.only(right: 10),
        prefixIcon: Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'التليفون',
        hint: 'التليفون',
        iconPathWidth: 17,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      CustomTextField(
        contentPadding: EdgeInsets.only(right: 10),
        prefixIcon: Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'حيازه',
        hint: 'حيازه',
        iconPathWidth: 17,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[Text('تاريخ الميلاد')],
          ).addPaddingOnly(bottom: 8),
          InkWell(
            onTap: () async {
              // await openPickerDateSingle(context);
            },
            child: ValueListenableBuilder<DateTime?>(
                valueListenable: checkInNotifier,
                builder: (BuildContext context, DateTime? dateTime, _) {
                  return DateSelector(
                    dateTime: dateTime,
                    enable: false,
                    onChanged: (_) => print('selected DateTime => ${dateTime}'),
                  );
                }),
          ),
        ],
      ),
      CustomTextField(
        contentPadding: EdgeInsets.only(right: 10),
        prefixIcon: Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
        // borderColor: AppColor.BORDER_COLOR,
        onChangedText: (String text) => print('test => $text'),
        outLineText: 'الوظيفه',
        hint: 'الوظيفه',
        iconPathWidth: 17,
        textInputType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
      SizedBox(height: 10),
      ValueListenableBuilder(
          valueListenable: _selectedHealth,
          builder: (BuildContext context, String? status, _) {
            return AppDropdownButton<String>(
                validator: TextFieldValidators.isNotEmpty,
                outLineText: 'الحالة الصحية',
                hintText: 'اختر الحالة الصحية',
                value: status,
                items: healthKeys.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onSaved: (vlu) => print('value => $vlu'),
                onChanged: (dynamic value) {
                  _selectedHealth.value = value;
                });
          }),
      SizedBox(
        height: 10,
      ),
    ],
  ).addPaddingOnly(bottom: context.mediaQueryPadding.bottom);
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
