import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/base_social_status_repository.dart';

class RemoveAllSocialStatuesUseCase {
  RemoveAllSocialStatuesUseCase(this.repository);
  BaseSocialStatusRepository repository;

  Future<Either<Failure, Unit>> execute() async {
    return await repository.deleteAll();
  }
}
