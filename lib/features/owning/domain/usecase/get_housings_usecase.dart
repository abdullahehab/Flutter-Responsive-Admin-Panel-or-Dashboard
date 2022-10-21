import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/owning.dart';
import '../repositories/base_owning_repository.dart';

class GetOwningUseCase {
  GetOwningUseCase(this.repository);
  BaseOwningRepository repository;

  Future<Either<Failure, List<Owning>>> execute(
      {required bool restoreData}) async {
    return await repository.getAllOwning(restoreData: restoreData);
  }
}
