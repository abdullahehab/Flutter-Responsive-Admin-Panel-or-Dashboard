import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_work_repository.dart';

class RemoveAllWorksUseCase {
  RemoveAllWorksUseCase(this.repository);
  BaseWorkRepository repository;

  Future<Either<Failure, Unit>> execute() async {
    return await repository.deleteAll();
  }
}
