import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class BaseSocialStatusRepository {
  Future<Either<Failure, List<SocialStatus>>> getAllSocialStatues({required bool restoreData});
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required SocialStatus model});
  Future<Either<Failure, Unit>> deleteAll();
  Future<Either<Failure, Unit>> deleteItem({required String id});
}
