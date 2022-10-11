import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/social_status.dart';
import '../repositories/base_social_status_repository.dart';

class GetSocialStatuesUseCase {
  GetSocialStatuesUseCase(this.repository);
  BaseSocialStatusRepository repository;

  Future<Either<Failure, List<SocialStatus>>> execute() async {
    return await repository.getAllSocialStatues();
  }
}
