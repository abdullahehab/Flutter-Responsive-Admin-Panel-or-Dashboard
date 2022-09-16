import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../models/user_model.dart';

abstract class UserDataSource {
  Future<Either<Failure, Unit>> addUser(UserModel user);
}

class UserRemoteDataSourceImp implements UserDataSource {
  @override
  Future<Either<Failure, Unit>> addUser(UserModel user) async {
    Firestore.instance.document(user.nationalId.toString());

    Firestore.instance.settings(persistenceEnabled: true);

    bool isExist = await doesNameAlreadyExist(user.nationalId.toString());
    if (!isExist) {
      print('موجود بالفعل');
      return Left(ServerFailure());
    }

    try {
      await Firestore.instance
          .collection('users')
          .document(user.nationalId.toString())
          .setData(user.toJson());

      return Right(unit);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<bool> doesNameAlreadyExist(String nationalId) async {
    DocumentReference qs =
        Firestore.instance.collection('users').document(nationalId);
    DocumentSnapshot snap = await qs.get();

    return snap.data == null;
  }
}
