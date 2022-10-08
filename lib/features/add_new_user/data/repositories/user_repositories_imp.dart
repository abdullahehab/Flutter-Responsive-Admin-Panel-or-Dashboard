import 'package:admin/core/error/failures.dart';
import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/domain/repositories/user_repository.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp implements UserRepository {
  UserRepositoryImp(this.remoteDataSourceImp);
  UserRemoteDataSourceImp remoteDataSourceImp;

  @override
  Future<Either<Failure, Unit>> addUser(UserModel user) {
    return remoteDataSourceImp.addUser(user);
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserModel user) {
    return remoteDataSourceImp.updateUser(user);
  }
}
