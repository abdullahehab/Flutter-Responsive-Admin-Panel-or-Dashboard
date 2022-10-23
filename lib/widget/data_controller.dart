import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/shared_components/error_dialog.dart';

DataCell dataController({
  void Function()? onRemovePressed,
  void Function()? onEditPressed,
  void Function()? onViewPressed,
}) {
  return DataCell(
    Row(
      children: [
        if (onViewPressed != null) ...{
          InkWell(
            onTap: onViewPressed,
            child: Text('عرض', style: TextStyle(color: Colors.blue)),
          ),
          VerticalDivider()
        },
        if (onEditPressed != null) ...{
          InkWell(
            onTap: onEditPressed,
            child: Text('تعديل', style: TextStyle(color: Colors.blue)),
          ),
          VerticalDivider()
        },
        if (onRemovePressed != null)
          InkWell(
            onTap: () {
              dialogRemoveYesNo(
                context: Get.context!,
                btnYesPress: onRemovePressed,
              );
            },
            child: Text('حذف', style: TextStyle(color: Colors.red)),
          ),
      ],
    ),
  );
}

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        height: 20,
        width: 1,
        color: Colors.black,
      ),
    );
  }
}
