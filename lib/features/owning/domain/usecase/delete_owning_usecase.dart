import 'package:admin/features/housing/domain/repositories/base_work_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_owning_repository.dart';

class RemoveOwningUseCase {
  RemoveOwningUseCase(this.repository);
  BaseOwningRepository repository;

  Future<Either<Failure, Unit>> execute({required String id}) async {
    return await repository.deleteItem(id: id);
  }
}
