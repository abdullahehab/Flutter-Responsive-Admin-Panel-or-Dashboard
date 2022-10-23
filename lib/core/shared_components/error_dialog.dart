import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

Future<void> dialogRemoveYesNo({
  required BuildContext context,
  dynamic Function()? btnYesPress,
  DialogType dialogType = DialogType.QUESTION,
  String? title = 'هل انت متأكد ؟',
  String? des = 'لا يمكن التراجع عن الحذف, هل ترغب بالإستمرار ؟',

}) async {
  AwesomeDialog(
    width: 500,
    context: context,
    dialogType: dialogType,
    animType: AnimType.BOTTOMSLIDE,
    headerAnimationLoop: true,
    dismissOnTouchOutside: false,
    title: title,
    desc: des,
    btnOkText: 'موافق',
    btnOkOnPress: btnYesPress,
    btnCancelText: 'إلغاء',
    showCloseIcon: true,
    // btnCancelOnPress: () {
    //   Navigator.pop(context);
    // },
  ).show();
}


