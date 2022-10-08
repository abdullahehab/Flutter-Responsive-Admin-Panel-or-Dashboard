import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> addUser(UserModel user);
  Future<Either<Failure, Unit>> updateUser(UserModel user);
}
