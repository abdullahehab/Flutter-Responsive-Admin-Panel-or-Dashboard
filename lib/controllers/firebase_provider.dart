import 'dart:async';

import 'package:admin/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireBaseProvider extends ChangeNotifier {
  Future<bool> doesNameAlreadyExist(String nationalId) async {
    DocumentReference qs =
        Firestore.instance.collection('users').document(nationalId);
    DocumentSnapshot snap = await qs.get();

    return snap.data == null;
  }

  void addToFirebase({@required UserModel? userModel}) async {
    Firestore.instance.document(userModel!.nationalId.toString());

    Firestore.instance.settings(persistenceEnabled: true);

    bool isExist = await doesNameAlreadyExist(userModel.nationalId.toString());
    if (!isExist) {
      print('موجود بالفعل');
      return;
    }
    await Firestore.instance
        .collection('users')
        .document(userModel.nationalId.toString())
        .setData(userModel.toJson());

    print('تم الاضافه بنجاح');
  }
}
