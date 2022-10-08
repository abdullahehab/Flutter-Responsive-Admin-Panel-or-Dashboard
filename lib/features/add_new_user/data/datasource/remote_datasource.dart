import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/user_model.dart';

abstract class UserDataSource {
  Future<Either<Failure, Unit>> addUser(UserModel user);
  Future<Either<Failure, Unit>> updateUser(UserModel user);
}

class UserRemoteDataSourceImp implements UserDataSource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<Either<Failure, Unit>> addUser(UserModel user) async {
    final CollectionReference _mainCollection = _fireStore.collection('users');
    DocumentReference documentReferencer =
        _mainCollection.doc(user.nationalId.toString());

    bool isExist = await userIsExist(user.nationalId.toString());
    if (isExist) {
      return Left(UnAuthFailure(mess: "موجود بالفعل"));
    }

    try {
      await documentReferencer.set(user.toJson());

      return Right(unit);
    } catch (e) {
      return Left(UnAuthFailure(mess: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserModel user) async {
    final CollectionReference _mainCollection = _fireStore.collection('users');

    DocumentReference documentReferencer =
        _mainCollection.doc('٧٨٧٨٧٨٧٨٧٨٧٨٧٨');

    try {
      await documentReferencer.update(user.toJson());

      return Right(unit);
    } catch (e) {
      return Left(UnAuthFailure(mess: e.toString()));
    }
  }

  Future<bool> userIsExist(String nationalId) async {
    final CollectionReference _mainCollection = _fireStore.collection('users');
    DocumentReference dr = _mainCollection.doc(nationalId);
    DocumentSnapshot snap = await dr.get();

    return snap.exists;
  }
}
