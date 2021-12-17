import 'package:admin/extensions/extension.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/utils/text_field_validator.dart';
import 'package:admin/utils/validator.dart';
import 'package:admin/widget/custom_text_field.dart';
import 'package:admin/widget/date_selector.dart';
import 'package:admin/widget/gender_selector.dart';
import 'package:admin/widget/get_date_from_picker_dialog.dart';
import 'package:admin/widget/health_drop_down.dart';
import 'package:admin/widget/main_button.dart';
import 'package:admin/widget/status_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../constants.dart';
import '../../responsive.dart';

class NewPeople extends StatelessWidget {
  ValueNotifier<String?> _statusNotifier =
      ValueNotifier<String?>(statusKeys.first);
  ValueNotifier<String?> _healthNotifier = ValueNotifier<String?>(null);
  ValueNotifier<DateTime?> _birthDateNotifier = ValueNotifier<DateTime?>(null);

  static final _formKey = new GlobalKey<FormState>();

  Future<void> openDatePickerHotel(BuildContext context) async {
    final PickerDateRange range =
        await getDateFromPickerDialog(context, PickerSelectionMode.single)
            as PickerDateRange;

    print('range => ${range.startDate}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.kMainBackgroundColor,
        drawer: Responsive.isMobile() ? Drawer(child: SideMenu()) : null,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            'جديد',
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          GenderSelector(
                            onChanged: (newValue) {},
                            onSaved: (newValue) {},
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.user,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'الاسم',
                            hint: 'الاسم',
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: TextFieldValidators.isName,
                            onSaved: (String email) {},
                            onChanged: (String email) {
                              print('test => $email');
                            },

                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.addressBook,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'العنوان',
                            hint: 'العنوان',
                            iconPathWidth: 17,
                            validator: TextFieldValidators.isAddress,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.idCard,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'الرقم القومي',
                            hint: 'الرقم القومي',
                            iconPathWidth: 17,
                            validator: TextFieldValidators.isNationalId,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.phone,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'التليفون',
                            hint: 'التليفون',
                            iconPathWidth: 17,
                            validator: TextFieldValidators.isPhone,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.moneyBillWave,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'حيازه',
                            hint: 'حيازه',
                            iconPathWidth: 17,
                            validator: TextFieldValidators.isNotEmpty,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          StatusDropDownMenu(
                            validator: TextFieldValidators.isSocialStatus,
                            onChanged: (selectedValue) =>
                                _statusNotifier.value = selectedValue,
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[Text('تاريخ الميلاد')],
                              ).addPaddingOnly(bottom: 8),
                              InkWell(
                                onTap: () async {
                                  await openDatePickerHotel(context);

                                  // final checkoutValue = checkoutNotifier?.value;
                                  // if (checkoutValue == null) return;
                                  // onCheckOutSaved
                                  //     ?.call(checkoutValue?.toYYYYMMDDWithOutLocalization());
                                  //
                                  // final checkInValue = checkInNotifier?.value;
                                  // if (checkInValue == null) return;
                                  // onCheckInSaved
                                  //     ?.call(checkInValue?.toYYYYMMDDWithOutLocalization());
                                },
                                child: ValueListenableBuilder<DateTime?>(
                                    valueListenable: _birthDateNotifier,
                                    builder: (BuildContext context,
                                        DateTime? dateTime, _) {
                                      return DateSelector(
                                          withIcon: true,
                                          dateTime: dateTime,
                                          enable: true,
                                          onChanged: (dateTime) =>
                                              _birthDateNotifier.value =
                                                  dateTime);
                                    }),
                              ),
                            ],
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.networkWired,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'الوظيفه',
                            hint: 'الوظيفه',
                            iconPathWidth: 17,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            validator: TextFieldValidators.isNotEmpty,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          HealthDropDownMenu(
                            validator: TextFieldValidators.isHealthStatus,
                            onChanged: (selectedValue) =>
                                _healthNotifier.value = selectedValue,
                          ),
                          CustomTextField(
                            prefixIcon: Icon(FontAwesomeIcons.home,
                                size: APP_ICON_SIZE),
                            borderColor: AppColor.kPrimaryDarkColor,
                            outLineText: 'السكن',
                            hint: 'السكن',
                            iconPathWidth: 17,
                            validator: TextFieldValidators.isNotEmpty,
                            textInputType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ).addPaddingAll(20),
                ),
              ).addPaddingAll(10),
              SizedBox(
                height: 0.h,
              ),
              ValueListenableBuilder(
                  valueListenable: _statusNotifier,
                  builder: (BuildContext? context, String? status, _) =>
                      husbandForm(context!, status!))
            ],
          ),
        ),
        floatingActionButton: CustomButton(
          width: context.width * .3,
          // height: 30.h,
          text: 'حفظ',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
          },
          buttonColor: AppColor.kPrimaryDarkColor,
        ));
  }

  Widget husbandForm(BuildContext context, String status) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      height: status == statusKeys[1] ? 950 : 0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text("بيانات الزوج/ الزوجه",
                  style: Theme.of(context).textTheme.headline6)
              .addPaddingOnly(right: 20),
          SizedBox(height: 20.h),
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  prefixIcon: Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'الاسم',
                  hint: 'الاسم',
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: TextFieldValidators.isName,
                  onSaved: (String email) {},
                  onChanged: (String email) {
                    print('test => $email');
                  },

                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                CustomTextField(
                  prefixIcon:
                      Icon(FontAwesomeIcons.addressBook, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'العنوان',
                  hint: 'العنوان',
                  iconPathWidth: 17,
                  validator: TextFieldValidators.isAddress,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  prefixIcon:
                      Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'الرقم القومي',
                  hint: 'الرقم القومي',
                  iconPathWidth: 17,
                  validator: TextFieldValidators.isNationalId,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                CustomTextField(
                  prefixIcon: Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'التليفون',
                  hint: 'التليفون',
                  iconPathWidth: 17,
                  validator: TextFieldValidators.isPhone,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                CustomTextField(
                  prefixIcon:
                      Icon(FontAwesomeIcons.moneyBillWave, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'حيازه',
                  hint: 'حيازه',
                  iconPathWidth: 17,
                  validator: TextFieldValidators.isNotEmpty,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                StatusDropDownMenu(
                  validator: TextFieldValidators.isSocialStatus,
                  onChanged: (selectedValue) =>
                      _statusNotifier.value = selectedValue,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text('تاريخ الميلاد')],
                    ).addPaddingOnly(bottom: 8),
                    InkWell(
                      onTap: () async {
                        await openDatePickerHotel(context);

                        // final checkoutValue = checkoutNotifier?.value;
                        // if (checkoutValue == null) return;
                        // onCheckOutSaved
                        //     ?.call(checkoutValue?.toYYYYMMDDWithOutLocalization());
                        //
                        // final checkInValue = checkInNotifier?.value;
                        // if (checkInValue == null) return;
                        // onCheckInSaved
                        //     ?.call(checkInValue?.toYYYYMMDDWithOutLocalization());
                      },
                      child: ValueListenableBuilder<DateTime?>(
                          valueListenable: _birthDateNotifier,
                          builder:
                              (BuildContext context, DateTime? dateTime, _) {
                            return DateSelector(
                                withIcon: true,
                                dateTime: dateTime,
                                enable: true,
                                onChanged: (dateTime) =>
                                    _birthDateNotifier.value = dateTime);
                          }),
                    ),
                  ],
                ),
                CustomTextField(
                  prefixIcon:
                      Icon(FontAwesomeIcons.networkWired, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'الوظيفه',
                  hint: 'الوظيفه',
                  iconPathWidth: 17,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: TextFieldValidators.isNotEmpty,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                HealthDropDownMenu(
                  validator: TextFieldValidators.isHealthStatus,
                  onChanged: (selectedValue) =>
                      _healthNotifier.value = selectedValue,
                ),
                CustomTextField(
                  prefixIcon: Icon(FontAwesomeIcons.home, size: APP_ICON_SIZE),
                  borderColor: AppColor.kPrimaryDarkColor,
                  outLineText: 'السكن',
                  hint: 'السكن',
                  iconPathWidth: 17,
                  validator: TextFieldValidators.isNotEmpty,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ).addPaddingAll(20).addPaddingAll(0),
        ],
      ).addPaddingAll(0),
    ).addPaddingAll(10);
  }
}
