import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getAllUsers();
  Future<Either<Failure, Unit>> addUser(UserModel user);
  Future<Either<Failure, Unit>> delete(String userId);
  Future<Either<Failure, Unit>> updateUser(UserModel user);
}
