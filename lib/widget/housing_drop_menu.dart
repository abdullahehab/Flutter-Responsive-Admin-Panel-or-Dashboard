import 'package:admin/constants.dart';
import 'package:admin/models/general_model.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';
import 'package:get/get.dart';
class StatusDropDownMenu extends StatelessWidget {
  StatusDropDownMenu({@required this.onChanged, this.validator});

  List<GeneralModel> list = [GeneralModel(title: 'test', id: 1)];
  ValueNotifier<GeneralModel?> _cityNotifier =
      ValueNotifier<GeneralModel?>(null);
  ValueChanged<GeneralModel>? onChanged;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<GeneralModel?>(
      valueListenable: _cityNotifier,
      builder: (BuildContext context, GeneralModel? govern, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'السكن',
            ),
            SizedBox(height: 10.h),
            FormField(
              validator: (String? value) {
                if (validator != null) {
                  final String? valid = validator!(value ?? '');
                  return valid;
                }

                return null;
              },
              builder: (field) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 43.h,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(APP_BORDER_RADIUS),
                        border: Border.all(
                            color: field.hasError
                                ? Colors.red
                                : AppColor.kPrimaryDarkColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<GeneralModel>(
                        hint: Text(
                          "اختر الحالة الاجتماعية",
                        ),
                        value: govern,
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: AppColor.kPrimaryColor.withOpacity(.4)),
                        onChanged: (GeneralModel? newValue) {
                          _cityNotifier.value = newValue!;
                          field.setValue(newValue);
                          field.validate();
                          if (onChanged != null) onChanged!.call(newValue);
                        },
                        items: list.map<DropdownMenuItem<GeneralModel>>(
                            (GeneralModel value) {
                          return DropdownMenuItem<GeneralModel>(
                            value: value,
                            child: Text(value.title!),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  if (validator != null)
                    SizedBox(
                      height: 12,
                      child: (field.hasError)
                          ? Text(
                              '  ${field.errorText}',
                              style: TextStyle(
                                fontSize: 10.h,
                                height: 0.6,
                                color: Colors.red.shade800,
                              ),
                            )
                          : const SizedBox(),
                    ).addPaddingOnly(top: field.hasError ? 10 : 0)
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
