import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/housing.dart';

abstract class BaseHousingRepository {
  Future<Either<Failure, List<Housing>>> getAllHousings(
      {required bool restoreData});
  Future<Either<Failure, Unit>> add({required String title});
  Future<Either<Failure, Unit>> update({required Housing model});
  Future<Either<Failure, Unit>> deleteAll();
  Future<Either<Failure, Unit>> deleteItem({required String id});
}
