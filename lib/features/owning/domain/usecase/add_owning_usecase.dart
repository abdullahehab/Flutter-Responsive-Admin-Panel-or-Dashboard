import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/base_owning_repository.dart';

class AddOwningUsecase {
  BaseOwningRepository repository;

  AddOwningUsecase(this.repository);

  Future<Either<Failure, Unit>> execute({required String title}) {
    return repository.add(title: title);
  }
}
