import 'package:admin/features/social_status/domain/entities/social_status.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/work.dart';

abstract class BaseWorkRepository {
  Future<Either<Failure, List<Work>>> getAllWorks();
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required Work model});
  Future<Either<Failure, Unit>> deleteAll();
  Future<Either<Failure, Unit>> deleteItem({required String id});
}
