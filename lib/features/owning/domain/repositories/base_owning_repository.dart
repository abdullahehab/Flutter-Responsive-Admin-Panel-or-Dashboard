import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/owning.dart';

abstract class BaseOwningRepository {
  Future<Either<Failure, List<Owning>>> getAllOwning(
      {required bool restoreData});
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required Owning model});
  Future<Either<Failure, Unit>> deleteAll();
  Future<Either<Failure, Unit>> deleteItem({required String id});
}
