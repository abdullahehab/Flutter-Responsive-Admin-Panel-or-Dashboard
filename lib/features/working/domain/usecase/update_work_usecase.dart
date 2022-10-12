import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/work.dart';
import '../repositories/base_work_repository.dart';

class UpdateWorkUsecase {
  UpdateWorkUsecase(this.repository);
  BaseWorkRepository repository;

  Future<Either<Failure, Unit>> execute({required Work model}) {
    return repository.update(model: model);
  }
}
