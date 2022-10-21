import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_housing_repository.dart';

class RemoveHousingUseCase {
  RemoveHousingUseCase(this.repository);
  BaseHousingRepository repository;

  Future<Either<Failure, Unit>> execute({required String id}) async {
    return await repository.deleteItem(id: id);
  }
}
