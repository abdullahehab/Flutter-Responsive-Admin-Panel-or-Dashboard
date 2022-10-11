import 'package:admin/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../repositories/base_social_status_repository.dart';

class AddSocialStatusUsecase {
  BaseSocialStatusRepository repository;

  AddSocialStatusUsecase(this.repository);

  Future<Either<Failure, Unit>> execute({required String title}) {
    return repository.add(title: title);
  }
}
