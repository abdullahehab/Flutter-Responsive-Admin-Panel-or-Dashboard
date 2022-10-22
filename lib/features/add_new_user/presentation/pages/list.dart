import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/features/housing/presentation/controller/controller.dart';
import 'package:admin/features/owning/presentation/controller/controller.dart';
import 'package:admin/features/social_status/presentation/controller/controller.dart';
import 'package:admin/features/working/presentation/controller/controller.dart';
import 'package:admin/utils/page_route_name.dart';
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
    return controller.obx((state) => buildBody(state, context),
        onLoading: Scaffold(
          body: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        onEmpty: appEmpty(onPressed: () => Get.toNamed(PageRouteName.ADD_NEW)));
  }

  var socialStatusController = Get.find<SocialStatusController>();
  var workController = Get.find<WorkController>();
  var owningController = Get.find<OwningController>();
  var housingController = Get.find<HousingController>();
  Scaffold buildBody(List<UserEntity>? users, BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            StyledContent(
              subTitle: 'الاشخاص',
              leadingWidget: CustomButton(
                  width: 200,
                  height: 50,
                  text: 'اضافة شخص جديد',
                  onPressed: () => Get.toNamed(PageRouteName.ADD_NEW)),
              children: [
                dataTable(
                  columns: [
                    dataColumnItem(title: '#'),
                    dataColumnItem(title: 'الاسم'),
                    dataColumnItem(title: 'الحالة الاجتماعية'),
                    dataColumnItem(title: 'الوظيفة'),
                    dataColumnItem(title: 'العنوان'),
                    dataColumnItem(title: 'رقم الهاتف'),
                    dataColumnItem(title: 'الحيازة'),
                    dataColumnItem(title: 'السكن'),
                    dataColumnItem(title: 'الحالة الصحية'),
                    dataColumnItem(title: 'التمييز'),
                    dataColumnItem(title: 'عدد الابناء'),
                    dataColumnItem(title: 'الاجرائات'),
                  ],
                  rows: List.generate(users!.length, (index) {
                    var item = users.elementAt(index);
                    return DataRow(
                      cells: [
                        dataCellItem(data: item.nationalId.toString()),
                        dataCellItem(data: item.name!),
                        dataCellItem(
                            data: socialStatusController
                                .getById(item.socialStatus!)!.title!),
                        dataCellItem(
                            data: workController.getById(item.working!)!.title!),
                        dataCellItem(data: item.address!),
                        dataCellItem(data: item.phone!),
                        dataCellItem(
                            data: owningController.getById(item.owning!)!.title!),
                        dataCellItem(
                            data: housingController.getById(item.housing!)!.title!),
                        dataCellItem(data: item.healthStatus.toString()),
                        dataCellItem(data: item.type.toString()),
                        dataCellItem(data: item.childrenNumber.toString()),
                        dataController(
                            onEditPressed: () => Get.toNamed(
                                PageRouteName.ADD_NEW,
                                arguments: item),
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
