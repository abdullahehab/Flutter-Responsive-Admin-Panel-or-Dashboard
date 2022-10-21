import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/work.dart';
import '../repositories/base_work_repository.dart';

class GetWorksUseCase {
  GetWorksUseCase(this.repository);
  BaseWorkRepository repository;

  Future<Either<Failure, List<Work>>> execute({required bool restoreData}) async {
    return await repository.getAllWorks(restoreData: restoreData);
  }
}
