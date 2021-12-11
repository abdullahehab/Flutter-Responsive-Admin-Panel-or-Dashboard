import 'package:admin/screens/main/components/side_menu.dart';
import 'package:admin/utils/colors.dart';
import 'package:admin/widget/custom_text_field.dart';
import 'package:admin/widget/gender_selector.dart';
import 'package:admin/widget/status_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPeople extends StatelessWidget {
  const NewPeople({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kMainBackgroundColor,
      drawer: Responsive.isMobile(context) ? Drawer(child: SideMenu()) : null,
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
      body: SafeArea(
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
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon:
                            Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'الاسم',
                        hint: 'الاسم',
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon: Icon(FontAwesomeIcons.addressBook,
                            size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'العنوان',
                        hint: 'العنوان',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                ],
              ).addPaddingHorizontalVertical(horizontal: 16),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon:
                            Icon(FontAwesomeIcons.idCard, size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'الرقم القومي',
                        hint: 'الرقم القومي',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon:
                            Icon(FontAwesomeIcons.phone, size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'التليفون',
                        hint: 'التليفون',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                ],
              ).addPaddingHorizontalVertical(horizontal: 16),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon: Icon(FontAwesomeIcons.moneyBillWave,
                            size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'حيازه',
                        hint: 'حيازه',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: StatusDropDownMenu(
                        onChanged: (selectedValue) => print('selected'),
                      )),
                ],
              ).addPaddingHorizontalVertical(horizontal: 16),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon: Icon(FontAwesomeIcons.calendar,
                            size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'تاريخ الميلاد',
                        hint: 'تاريخ الميلاد',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon: Icon(FontAwesomeIcons.networkWired,
                            size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'الوظيفه',
                        hint: 'الوظيفه',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                ],
              ).addPaddingHorizontalVertical(horizontal: 16),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon: Icon(FontAwesomeIcons.procedures,
                            size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'الحالة الصحية',
                        hint: 'الحالة الصحية',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: CustomTextField(
                        prefixIcon:
                            Icon(FontAwesomeIcons.home, size: APP_ICON_SIZE),
                        borderColor: AppColor.kPrimaryDarkColor,
                        outLineText: 'السكن',
                        hint: 'السكن',
                        iconPathWidth: 17,
                        textInputType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        // onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocus),
                      )),
                ],
              ).addPaddingHorizontalVertical(horizontal: 16),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HusbandForm extends StatelessWidget {
  const HusbandForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
