import 'package:admin/core/error/failures.dart';
import 'package:admin/features/add_new_user/domain/repositories/user_repository.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

class UpdateUserUsecase {
  UserRepository repository;

  UpdateUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserEntity user) {
    return repository.updateUser(user);
  }
}
