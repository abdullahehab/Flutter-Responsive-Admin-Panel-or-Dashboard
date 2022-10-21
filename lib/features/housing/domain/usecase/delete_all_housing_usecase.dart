import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_housing_repository.dart';

class RemoveAllHousingsUseCase {
  RemoveAllHousingsUseCase(this.repository);
  BaseHousingRepository repository;

  Future<Either<Failure, Unit>> execute() async {
    return await repository.deleteAll();
  }
}
