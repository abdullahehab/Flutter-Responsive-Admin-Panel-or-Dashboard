import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_work_repository.dart';

class RemoveWorkUseCase {
  RemoveWorkUseCase(this.repository);
  BaseWorkRepository repository;

  Future<Either<Failure, Unit>> execute({required String id}) async {
    return await repository.deleteItem(id: id);
  }
}
