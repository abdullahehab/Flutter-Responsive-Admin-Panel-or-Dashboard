import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/owning.dart';
import '../repositories/base_owning_repository.dart';

class UpdateOwningUsecase {
  UpdateOwningUsecase(this.repository);
  BaseOwningRepository repository;

  Future<Either<Failure, Unit>> execute({required Owning model}) {
    return repository.update(model: model);
  }
}
