import 'package:admin/core/constants/constants.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';
import 'package:get/get.dart';
class StatusDropDownMenu extends StatelessWidget {
  StatusDropDownMenu({@required this.onChanged, this.validator});

  ValueNotifier<String?> _cityNotifier = ValueNotifier<String?>(null);
  ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _cityNotifier,
      builder: (BuildContext context, String? govern, _) {
        print('status => $govern');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الحالة الاجتماعية',
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
                      child: DropdownButton<String>(
                        hint: Text(
                          "اختر الحالة الاجتماعية",
                        ),
                        value: govern,
                        icon: Icon(Icons.keyboard_arrow_down_rounded,
                            color: AppColor.kPrimaryColor.withOpacity(.4)),
                        onChanged: (String? newValue) {
                          _cityNotifier.value = newValue!;
                          field.setValue(newValue);
                          field.validate();
                          if (onChanged != null) onChanged!.call(newValue);
                        },
                        items: statusKeys
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
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
