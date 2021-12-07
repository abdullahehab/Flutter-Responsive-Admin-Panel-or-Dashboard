import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
class ProfileDropDownMenu extends StatelessWidget {
  ProfileDropDownMenu({@required this.onChanged});

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
            Container(
              height: 43.h,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(10),
                  border: Border.all(color: primaryColor)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Row(
                    children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                          child: Text("Angelina Jolie"),
                        ),
                    ],
                  ),
                  value: govern,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded,
                      ),
                  // style: textFiledTitleStyle,
                  onChanged: (String? newValue) {
                    _cityNotifier.value = newValue!;
                    onChanged!.call(newValue);
                  },
                  items: <String>['تسجيل خروج']
                      .map<DropdownMenuItem<String>>((String value) {
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
