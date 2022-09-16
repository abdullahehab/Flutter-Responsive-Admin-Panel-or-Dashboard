import 'package:admin/core/error/failures.dart';
import 'package:admin/features/add_new_user/domain/repositories/user_repository.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

class AddUserUsecase {
  UserRepository repository;

  AddUserUsecase(this.repository);

  Future<Either<Failure, Unit>> call(UserModel user) {
    return repository.addUser(user);
  }
}
