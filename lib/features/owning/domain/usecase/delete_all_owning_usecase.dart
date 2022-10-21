import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_owning_repository.dart';

class RemoveAllOwningUseCase {
  RemoveAllOwningUseCase(this.repository);
  BaseOwningRepository repository;

  Future<Either<Failure, Unit>> execute() async {
    return await repository.deleteAll();
  }
}
