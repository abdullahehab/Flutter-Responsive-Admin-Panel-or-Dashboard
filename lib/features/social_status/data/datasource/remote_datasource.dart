import 'package:admin/features/social_status/data/models/social_status_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/social_status.dart';

abstract class BaseRemoteDataSource {
  Future<List<SocialStatusModel>> getAllSocialStatues();
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required SocialStatusModel model});
  Future<Either<Failure, Unit>> delete();
}

class SocialStatusRemoteDataSource implements BaseRemoteDataSource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<SocialStatusModel>> getAllSocialStatues() async {
    final DocumentSnapshot _mainCollection =
        await _fireStore.collection('constants').doc('socialStatuses').get();

    var list = List<SocialStatusModel>.from((_mainCollection.get('data'))
        .map((e) => SocialStatusModel.fromJson(e)));
    return list.reversed.toList();
  }

  @override
  Future<Either<Failure, Unit>> add({required String title}) async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('socialStatuses');

    Map<String, dynamic> data = <String, dynamic>{
      "id": DateTime.now().millisecondsSinceEpoch,
      "title": title,
    };

    try {
      await _mainCollection.set({
        'data': FieldValue.arrayUnion([data])
      }, SetOptions(merge: true));
      return Right(unit);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(mess: e.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> update(
      {required SocialStatusModel model}) async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('socialStatuses');

    var list = await getAllSocialStatues();

    var item = list.firstWhere((element) => element.id == model.id);

    int index = list.indexOf(item);

    list.remove(item);
    list.insert(index, model);


    try {
      for (item in list) {
        await _mainCollection.set({
          'data': FieldValue.arrayUnion([item.toJson()])
        }, SetOptions(merge: true));
      }

      return Right(unit);
    } catch (e) {
      print('e => $e');
      return Left(UnAuthFailure(mess: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
