import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/user_model.dart';
import '../../domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, Unit>> addUser(UserModel user);
  Future<Either<Failure, Unit>> delete(String userId);
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

    DocumentReference documentReferencer = _mainCollection.doc(user.nationalId);

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

  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final QuerySnapshot _mainCollection =
          await _fireStore.collection('users').get();

      final allUsers = _mainCollection.docs
          .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return Right(allUsers);
    } catch (e) {
      return Left(ServerFailure(mess: 'ةنا خطا ما في جلب المستخدمين'));
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(String userId) async {
    final CollectionReference _mainCollection = _fireStore.collection('users');

    DocumentReference documentReferencer = _mainCollection.doc(userId);

    try {
      await documentReferencer.delete();

      return Right(unit);
    } catch (e) {
      return Left(UnAuthFailure(mess: e.toString()));
    }
  }
}
