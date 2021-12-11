import 'package:admin/constants.dart';
import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';

class StatusDropDownMenu extends StatelessWidget {
  StatusDropDownMenu({@required this.onChanged});

  ValueNotifier<String?> _cityNotifier = ValueNotifier<String?>(null);
  ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _cityNotifier,
      builder: (BuildContext context, String? govern, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الحالة الاجتماعية',
            ),
            SizedBox(height: 10.h),
            Container(
              height: 43.h,
              width: context.width,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(APP_BORDER_RADIUS),
                  border: Border.all(color: AppColor.kPrimaryDarkColor)),
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
                    if (onChanged != null) onChanged!.call(newValue);
                  },
                  items:
                      statusKeys.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
