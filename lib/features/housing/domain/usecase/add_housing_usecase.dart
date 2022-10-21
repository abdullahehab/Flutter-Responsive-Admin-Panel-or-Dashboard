import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/base_work_repository.dart';

class AddHousingUsecase {
  BaseHousingRepository repository;

  AddHousingUsecase(this.repository);

  Future<Either<Failure, Unit>> execute({required String title}) {
    return repository.add(title: title);
  }
}
