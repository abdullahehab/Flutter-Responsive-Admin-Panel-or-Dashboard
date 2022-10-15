import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

import '../../../../core/constants/db_constants.dart';
import '../models/social_status_model.dart';

abstract class BaseLocalDataSource {
  Future<List<SocialStatusModel>> getAllSocialStatues();
  Future<int> insert({required SocialStatusModel model});
  Future<int> update({required SocialStatusModel model});
  Future deleteAll();
  Future<int> deleteItem({required String id});
}

Future? _doneFuture;
StoreRef<int, Map<String, Object?>>? _socialStatusStore;

// database instance
late final Database? _db;

class SocialStatusLocalDataSource implements BaseLocalDataSource {
  // Constructor
  SocialStatusLocalDataSource() {
    _doneFuture = init();
  }
  // {
  //   if (kIsWeb) {
  //     print('is => web');
  //     _socialStatusStore = intMapStoreFactory.store();
  //   } else {
  //     print('is => not web');
  //     _socialStatusStore =
  //         intMapStoreFactory.store(DBConstants.SOCIAL_STATUS_NAME);
  //   }
  // }

  Future init() async {
    // Declare our store (records are mapd, ids are ints)
    _socialStatusStore =
        intMapStoreFactory.store(DBConstants.SOCIAL_STATUS_NAME);
    // _socialStatusStore = store;
    var factory = databaseFactoryWeb;

    // Open the database
    _db = await factory.openDatabase('test');
  }

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
  Future<List<SocialStatusModel>> getAllSocialStatues() async {
    List<SocialStatusModel>? socialStatuesList;

    final recordSnapshots = await _socialStatusStore!.find(
      _db!,
    );

    print("get all data => $recordSnapshots");
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
