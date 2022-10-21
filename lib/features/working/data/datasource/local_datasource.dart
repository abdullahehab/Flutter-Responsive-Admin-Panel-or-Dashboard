import 'package:hive/hive.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/social_status_model.dart';

abstract class WorkBaseLocalDataSource {
  Future<List<WorkModel>> getCachedWorkList();
  Future<int> insert({required WorkModel model});
  Future deleteAll();
}

class WorkLocalDataSource implements WorkBaseLocalDataSource {
  final _socialBox = Hive.box(DBConstants.WORK_NAME);

  @override
  Future<int> insert({required WorkModel model}) async {
    return await _socialBox.add(model.toJson());
  }

  @override
  Future<List<WorkModel>> getCachedWorkList() async {
    List<WorkModel>? workList;
    final data = _socialBox.keys.map((key) {
      final value = _socialBox.get(key);
      return {'title': value['title'], 'id': value['id']};
    }).toList();

    workList = data.map((snapshot) {
      final socialStatus = WorkModel.fromJson(snapshot);
      return socialStatus;
    }).toList();

    if (workList.isEmpty) return [];
    return workList;
  }

  @override
  Future deleteAll() async {
    return await _socialBox.deleteAll(_socialBox.keys);
  }
}
