import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/widget/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../core/shared_components/styled_content_widget.dart';
import '../../../../core/shared_page/app_empty.dart';
import '../../../../widget/data_cell_item.dart';
import '../../../../widget/data_column_Item.dart';
import '../../../../widget/data_controller.dart';
import '../../../../widget/data_table.dart';
import '../controller/user_controller.dart';

class UsersList extends GetView<UserController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => buildBody(state),
        onLoading: Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        onEmpty: appEmpty(onPressed: () {}));
  }

  Scaffold buildBody(List<UserEntity>? users) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            StyledContent(
              subTitle: 'السكن',
              leadingWidget: CustomButton(
                  width: 200,
                  height: 50,
                  text: 'اضافة سكن جديد',
                  onPressed: () {}),
              children: [
                dataTable(
                  columns: [
                    dataColumnItem(title: '#'),
                    dataColumnItem(title: 'الاسم'),
                    dataColumnItem(title: 'الحاله الاجتماعيه'),
                    dataColumnItem(title: 'الوظيفه'),
                    dataColumnItem(title: 'العنوان'),
                    dataColumnItem(title: 'رقم الهاتف'),
                    dataColumnItem(title: 'الحيازه'),
                    dataColumnItem(title: 'السكن'),
                    dataColumnItem(title: 'الحاله الصحيه'),
                    dataColumnItem(title: 'الاجرائات'),
                  ],
                  rows: List.generate(users!.length, (index) {
                    var item = users.elementAt(index);
                    return DataRow(
                      cells: [
                        dataCellItem(data: item.nationalId.toString()),
                        dataCellItem(data: item.name!),
                        dataCellItem(data: item.socialStatus!),
                        dataCellItem(data: item.working!),
                        dataCellItem(data: item.address!),
                        dataCellItem(data: item.phone!),
                        dataCellItem(data: item.owning!),
                        dataCellItem(data: item.housing!),
                        dataCellItem(data: item.healthStatus.toString()),
                        dataController(
                            onEditPressed: () {},
                            onRemovePressed: () {},
                            onViewPressed: () {})
                      ],
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
