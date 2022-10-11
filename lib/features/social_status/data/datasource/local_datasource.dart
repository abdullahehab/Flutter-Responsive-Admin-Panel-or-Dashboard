import 'package:sembast/sembast.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/social_status_model.dart';

abstract class BaseLocalDataSource {
  Future<List<SocialStatusModel>> getAllSocialStatues();
  Future<int> insert({required SocialStatusModel model});
  Future<int> update({required SocialStatusModel model});
  Future deleteAll();
  Future<int> deleteItem({required String id});
}

class SocialStatusLocalDataSource implements BaseLocalDataSource {
  final _socialStatusStore =
      intMapStoreFactory.store(DBConstants.SOCIAL_STATUS_NAME);

  // database instance
  final Database _db;

  // Constructor
  SocialStatusLocalDataSource(this._db);

  @override
  Future<int> insert({required SocialStatusModel model}) async {
    return await _socialStatusStore.add(_db, model.toJson());
  }

  @override
  Future<List<SocialStatusModel>> getAllSocialStatues() async {
    List<SocialStatusModel>? socialStatuesList;

    final recordSnapshots = await _socialStatusStore.find(
      _db,
    );

    if (recordSnapshots != []) {
      socialStatuesList = recordSnapshots.map((snapshot) {
        final socialStatus = SocialStatusModel.fromJson(snapshot.value);
        // An ID is a key of a record from the database.
        socialStatus.id = snapshot.key;
        return socialStatus;
      }).toList();
    }

    if (socialStatuesList!.isEmpty) return [];
    return socialStatuesList;
  }

  @override
  Future deleteAll() async {
    await _socialStatusStore.drop(
      _db,
    );
  }

  @override
  Future<int> deleteItem({required String id}) async {
    final finder = Finder(filter: Filter.byKey(id));
    return await _socialStatusStore.delete(
      _db,
      finder: finder,
    );
  }

  @override
  Future<int> update({required SocialStatusModel model}) async {
    final finder = Finder(filter: Filter.byKey(model.id));
    return await _socialStatusStore.update(
      _db,
      model.toJson(),
      finder: finder,
    );
  }
}
