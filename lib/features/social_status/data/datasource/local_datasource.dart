import 'package:sembast/sembast.dart';

import '../models/social_status_model.dart';

abstract class BaseLocalDataSource {
  Future<List<SocialStatusModel>> getCachedSocialStatues();
  Future<int> insert({required SocialStatusModel model});
  Future<int> update({required SocialStatusModel model});
  Future deleteAll();
  Future<int> deleteItem({required String id});
}

class SocialStatusLocalDataSource implements BaseLocalDataSource {
  SocialStatusLocalDataSource(this._socialStatusStore, this._db);

  StoreRef<int, Map<String, Object?>>? _socialStatusStore;
  late final Database? _db;

  @override
  Future<int> insert({required SocialStatusModel model}) async {
    try {
      return await _socialStatusStore!.add(_db!, model.toJson());
    } catch (e) {
      print('insert error => $e');
    }
    return Future.value(0);
  }

  @override
  Future<List<SocialStatusModel>> getCachedSocialStatues() async {
    List<SocialStatusModel>? socialStatuesList;

    final recordSnapshots = await _socialStatusStore!.find(
      _db!,
    );

    if (recordSnapshots != []) {
      socialStatuesList = recordSnapshots.map((snapshot) {
        final socialStatus = SocialStatusModel.fromJson(snapshot.value);
        return socialStatus;
      }).toList();
    }

    if (socialStatuesList!.isEmpty) return [];
    return socialStatuesList;
  }

  @override
  Future deleteAll() async {
    await _socialStatusStore!.drop(
      _db!,
    );
  }

  @override
  Future<int> deleteItem({required String id}) async {
    final finder = Finder(filter: Filter.byKey(id));
    return await _socialStatusStore!.delete(
      _db!,
      finder: finder,
    );
  }

  @override
  Future<int> update({required SocialStatusModel model}) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    return await _socialStatusStore!.update(
      _db!,
      model.toJson(),
      finder: finder,
    );
  }
}
