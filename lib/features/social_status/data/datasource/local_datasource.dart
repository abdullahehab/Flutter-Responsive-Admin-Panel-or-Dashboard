import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/social_status_model.dart';

abstract class BaseLocalDataSource {
  Future<List<SocialStatusModel>> getCachedSocialStatues();
  Future<int> insert({required SocialStatusModel model});
  Future<void> update({required SocialStatusModel model});
  Future deleteAll();
  Future<void> deleteItem({required String id});
}

class SocialStatusLocalDataSource implements BaseLocalDataSource {
  SocialStatusLocalDataSource();

  final _socialBox = Hive.box(DBConstants.SOCIAL_STATUS_NAME);

  @override
  Future<int> insert({required SocialStatusModel model}) async {
    try {
      return await _socialBox.add(model.toJson());
    } catch (e) {
      print('insert error => $e');
    }
    return Future.value(0);
  }

  @override
  Future<List<SocialStatusModel>> getCachedSocialStatues() async {
    List<SocialStatusModel>? socialStatuesList;
    final data = _socialBox.keys.map((key) {
      final value = _socialBox.get(key);
      return {'title': value['title'], 'id': value['id']};
    }).toList();

    socialStatuesList = data.map((snapshot) {
      final socialStatus = SocialStatusModel.fromJson(snapshot);
      return socialStatus;
    }).toList();

    if (socialStatuesList.isEmpty) return [];
    return socialStatuesList;
  }

  @override
  Future<void> deleteItem({required String id}) async {
    await _socialBox
        .delete(id)
        .whenComplete(() => print('delete local done'))
        .catchError((error) => print('error delete local => $error'));
  }

  @override
  Future<void> update({required SocialStatusModel model}) async {
    return await _socialBox.put(model.id.toString(), model.toJson());
  }

  @override
  Future deleteAll() async {
    return await _socialBox.deleteAll(_socialBox.keys);
  }
}
