import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class BaseSocialStatusRepository {
  Future<Either<Failure, List<SocialStatus>>> getAllSocialStatues();
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update();
  Future<Either<Failure, Unit>> delete();
}
