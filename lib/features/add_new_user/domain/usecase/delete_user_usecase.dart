import 'package:admin/core/error/failures.dart';
import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/features/add_new_user/domain/repositories/user_repository.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

class DeleteUserUsecase {
  UserRepository repository;

  DeleteUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(String id) {
    return repository.delete(id);
  }
}
