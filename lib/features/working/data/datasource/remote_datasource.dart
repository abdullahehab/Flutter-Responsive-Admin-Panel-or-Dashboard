import 'package:admin/features/social_status/data/models/social_status_model.dart';
import 'package:admin/features/working/data/models/social_status_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/work.dart';

abstract class WorkBaseRemoteDataSource {
  Future<List<WorkModel>> getWorks();
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required WorkModel model});
  Future<Either<Failure, Unit>> deleteAll();
  Future<Either<Failure, Unit>> deleteItem({required String id});
}

class WorkRemoteDataSource implements WorkBaseRemoteDataSource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<List<WorkModel>> getWorks() async {
    final DocumentSnapshot _mainCollection =
        await _fireStore.collection('constants').doc('occupation').get();

    var list = List<WorkModel>.from((_mainCollection.get('data'))
        .map((e) => WorkModel.fromJson(e)));
    return list.reversed.toList();
  }

  @override
  Future<Either<Failure, Unit>> add({required String title}) async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('occupation');

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
      {required WorkModel model}) async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('occupation');

    var list = await getWorkStatues();

    var reversedList = list.reversed.toList();

    var item = reversedList.firstWhere((element) => element.id == model.id);

    int index = reversedList.indexOf(item);

    reversedList.remove(item);
    reversedList.insert(index, model);

    await deleteAll();

    try {
      for (item in reversedList) {
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
  Future<Either<Failure, Unit>> deleteAll() async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('occupation');

    try {
      await _mainCollection.delete();
      await _mainCollection
          .set({'data': FieldValue.arrayUnion([])}, SetOptions(merge: true));
      return Right(unit);
    } on FirebaseException catch (e) {
      return Left(FirebaseFailure(mess: e.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required String id}) async {
    final DocumentReference _mainCollection =
        _fireStore.collection('constants').doc('occupation');

    var list = await getWorkStatues();

    var reversedList = list.reversed.toList();

    var item =
        reversedList.firstWhere((element) => element.id.toString() == id);

    reversedList.remove(item);

    await deleteAll();

    try {
      for (item in reversedList) {
        await _mainCollection.set({
          'data': FieldValue.arrayUnion([item.toJson()])
        }, SetOptions(merge: true));
      }

      return Right(unit);
    } catch (e) {
      return Left(UnAuthFailure(mess: e.toString()));
    }
  }
}
