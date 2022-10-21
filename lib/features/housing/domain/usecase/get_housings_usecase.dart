import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/housing.dart';
import '../repositories/base_work_repository.dart';

class GetHousingsUseCase {
  GetHousingsUseCase(this.repository);
  BaseHousingRepository repository;

  Future<Either<Failure, List<Housing>>> execute({required bool restoreData}) async {
    return await repository.getAllHousings(restoreData: restoreData);
  }
}
