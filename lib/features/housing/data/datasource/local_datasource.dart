import 'package:hive/hive.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/housing_model.dart';

abstract class HousingBaseLocalDataSource {
  Future<List<HousingModel>> getCachedHousingsList();
  Future<int> insert({required HousingModel model});
  Future deleteAll();
}

class HousingLocalDataSource implements HousingBaseLocalDataSource {
  final _socialBox = Hive.box(DBConstants.HOUSING_NAME);

  @override
  Future<int> insert({required HousingModel model}) async {
    return await _socialBox.add(model.toJson());
  }

  @override
  Future<List<HousingModel>> getCachedHousingsList() async {
    List<HousingModel>? workList;
    final data = _socialBox.keys.map((key) {
      final value = _socialBox.get(key);
      return {'title': value['title'], 'id': value['id']};
    }).toList();

    workList = data.map((snapshot) {
      final socialStatus = HousingModel.fromJson(snapshot);
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
