import 'package:hive/hive.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/owning_model.dart';

abstract class OwningBaseLocalDataSource {
  Future<List<OwningModel>> getCachedOwningList();
  Future<int> insert({required OwningModel model});
  Future deleteAll();
}

class OwningLocalDataSource implements OwningBaseLocalDataSource {
  final _socialBox = Hive.box(DBConstants.OWNING_NAME);

  @override
  Future<int> insert({required OwningModel model}) async {
    return await _socialBox.add(model.toJson());
  }

  @override
  Future<List<OwningModel>> getCachedOwningList() async {
    List<OwningModel>? workList;
    final data = _socialBox.keys.map((key) {
      final value = _socialBox.get(key);
      return {'title': value['title'], 'id': value['id']};
    }).toList();

    workList = data.map((snapshot) {
      final socialStatus = OwningModel.fromJson(snapshot);
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
