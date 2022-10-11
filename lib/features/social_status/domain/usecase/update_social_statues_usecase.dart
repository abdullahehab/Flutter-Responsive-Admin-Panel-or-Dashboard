import 'package:admin/core/error/failures.dart';
import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:dartz/dartz.dart';

import '../repositories/base_social_status_repository.dart';

class UpdateSocialStatusUsecase {
  BaseSocialStatusRepository repository;

  UpdateSocialStatusUsecase(this.repository);

  Future<Either<Failure, Unit>> execute({required SocialStatus model}) {
    return repository.update(model: model);
  }
}
