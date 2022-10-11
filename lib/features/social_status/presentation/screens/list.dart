import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:admin/features/social_status/presentation/controller/controller.dart';
import 'package:admin/widget/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../core/shared_components/build_dialog.dart';
import '../../../../core/shared_components/styled_content_widget.dart';
import '../../../../core/shared_page/app_empty.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_field_validator.dart';
import '../../../../widget/custom_text_field.dart';
import '../../../../widget/custom_title.dart';
import '../../../../widget/data_cell_item.dart';
import '../../../../widget/data_column_Item.dart';
import '../../../../widget/data_controller.dart';
import '../../../../widget/data_table.dart';

class SocialStatuesList extends GetView<SocialStatusController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => buildBody(state),
        onEmpty: appEmpty(onPressed: () => addNewSocialStatues()));
  }

  Scaffold buildBody(List<SocialStatus>? unitsRoomList) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            StyledContent(
              subTitle: 'الحالات المضافة',
              leadingWidget: CustomButton(
                  width: 200,
                  height: 50,
                  text: 'اضافة حالة اجتماعية جديده',
                  onPressed: () => addNewSocialStatues()),
              children: [
                dataTable(
                  columns: [
                    dataColumnItem(title: '#'),
                    dataColumnItem(title: 'الاسم'),
                    dataColumnItem(title: 'الاجرائات'),
                  ],
                  rows: List.generate(unitsRoomList!.length, (index) {
                    var item = unitsRoomList.elementAt(index);
                    return DataRow(
                      cells: [
                        dataCellItem(data: item.id.toString()),
                        dataCellItem(data: item.title!),
                        dataController(
                          onEditPressed: () {},
                          onRemovePressed: () {},
                        )
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

  void addNewSocialStatues() {
    TextEditingController nameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    showDialog(
      context: Get.context!,
      barrierColor: Colors.grey[500]!.withOpacity(.4),
      builder: (_) => AppDialog(
        height: 250,
        title: 'add_new_note'.tr,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 30),
              Header(text: 'اضافة حالة اجتماعية جديدة'),
              Divider(),
              SizedBox(height: 20),
              CustomTextField(
                validator: TextFieldValidators.isName,
                prefixIcon: Icon(FontAwesomeIcons.user, size: APP_ICON_SIZE),
                contentPadding: EdgeInsets.only(right: 10),
                onChangedText: (String text) => nameController.text = text,
                hint: 'الاسم',
                outLineText: 'الاسم',
                iconPathWidth: 17,
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20),
              CustomButton(
                  buttonColor: AppColor.kPrimaryDarkColor,
                  borderRadius: 6,
                  height: 40,
                  buttonPadding: EdgeInsets.zero,
                  text: "حفظ",
                  withoutPadding: true,
                  onPressed: () {
                    if (_formKey.currentState!.validate() == false) {
                      return;
                    }
                    _formKey.currentState!.save();

                    controller.addSocialStatutes(title: nameController.text);
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
