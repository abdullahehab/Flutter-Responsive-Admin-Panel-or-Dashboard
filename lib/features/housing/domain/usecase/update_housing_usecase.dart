import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/housing.dart';
import '../repositories/base_work_repository.dart';

class UpdateHousingUsecase {
  UpdateHousingUsecase(this.repository);
  BaseHousingRepository repository;

  Future<Either<Failure, Unit>> execute({required Housing model}) {
    return repository.update(model: model);
  }
}
