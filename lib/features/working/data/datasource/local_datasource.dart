import 'package:sembast/sembast.dart';

import '../models/social_status_model.dart';

abstract class WorkBaseLocalDataSource {
  Future<List<WorkModel>> getCachedWorkList();
  Future<int> insert({required WorkModel model});
  Future<int> update({required WorkModel model});
  Future deleteAll();
  Future<int> deleteItem({required String id});
}

class WorkLocalDataSource implements WorkBaseLocalDataSource {
  WorkLocalDataSource(this._workStore, this._db);

  StoreRef<int, Map<String, Object?>>? _workStore;
  late final Database? _db;

  @override
  Future<int> insert({required WorkModel model}) async {
    try {
      return await _workStore!.add(_db!, model.toJson());
    } catch (e) {
      print('insert error => $e');
    }
    return Future.value(0);
  }

  @override
  Future<List<WorkModel>> getCachedWorkList() async {
    List<WorkModel>? workList;

    final recordSnapshots = await _workStore!.find(
      _db!,
    );

    if (recordSnapshots != []) {
      workList = recordSnapshots.map((snapshot) {
        final works = WorkModel.fromJson(snapshot.value);
        return works;
      }).toList();
    }

    if (workList!.isEmpty) return [];
    return workList;
  }

  @override
  Future deleteAll() async {
    await _workStore!.drop(
      _db!,
    );
  }

  @override
  Future<int> deleteItem({required String id}) async {
    final finder = Finder(filter: Filter.byKey(id));
    return await _workStore!.delete(
      _db!,
      finder: finder,
    );
  }

  @override
  Future<int> update({required WorkModel model}) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    return await _workStore!.update(
      _db!,
      model.toJson(),
      finder: finder,
    );
  }
}
