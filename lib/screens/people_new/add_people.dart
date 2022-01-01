import 'package:admin/extensions/extension.dart';
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

import '../../constants.dart';

ValueNotifier<String?> _selectedStatus = ValueNotifier<String?>(null);
ValueNotifier<String?> _selectedHealth = ValueNotifier<String?>(null);
final ValueNotifier<DateTime?> checkInNotifier = ValueNotifier<DateTime?>(null);

class AddPeople extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Future<void> openPickerDateSingle(BuildContext context) async {
    final DateTime dateTime =
        await getDateFromPickerDialog(context, PickerSelectionMode.single);

    if (dateTime == null) return;

    checkInNotifier.value = dateTime;
  }

  @override
  Widget build(BuildContext context) {
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
                text: "حفظ",
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
                // Wrap your DaysList in Expanded and provide scrollController to it
                SizedBox(height: 10),
                GenderSelector(
                  onChanged: (newValue) {},
                  onSaved: (newValue) {},
                ),
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
                  prefixIcon:
                      Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
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
                  prefixIcon:
                      Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
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
                ValueListenableBuilder(
                    valueListenable: _selectedStatus,
                    builder: (BuildContext context, String? status, _) {
                      return AppDropdownButton<String>(
                          validator: TextFieldValidators.isNotEmpty,
                          outLineText: 'الحالة الاجتماعية',
                          hintText: 'اختر الحالة الاجتماعية',
                          value: status,
                          items: statusKeys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onSaved: (vlu) => print('value => $vlu'),
                          onChanged: (dynamic value) {
                            _selectedStatus.value = value;
                          });
                    }),
                SizedBox(height: 10),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text('تاريخ الميلاد')],
                    ).addPaddingOnly(bottom: 8),
                    InkWell(
                      onTap: () async {
                        await openPickerDateSingle(context);
                      },
                      child: ValueListenableBuilder<DateTime?>(
                          valueListenable: checkInNotifier,
                          builder:
                              (BuildContext context, DateTime? dateTime, _) {
                            return DateSelector(
                              dateTime: dateTime,
                              enable: false,
                              onChanged: (_) =>
                                  print('selected DateTime => ${dateTime}'),
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
                          items: healthKeys
                              .map<DropdownMenuItem<String>>((String value) {
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
                ValueListenableBuilder(
                    valueListenable: _selectedStatus,
                    child: husbandForm(context),
                    builder: (BuildContext? context, String? status, child) {
                      return Container(
                          child: status == statusKeys[1] ? child : SizedBox());
                    }),
              ],
            ).addPaddingOnly(bottom: context.bottomSafeArea),
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
  ).addPaddingOnly(bottom: context.bottomSafeArea);
}
