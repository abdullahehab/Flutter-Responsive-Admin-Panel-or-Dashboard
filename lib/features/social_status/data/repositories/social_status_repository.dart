import 'package:admin/core/error/failures.dart';
import 'package:admin/features/social_status/data/datasource/remote_datasource.dart';

import 'package:admin/features/social_status/domain/entities/social_status.dart';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/base_social_status_repository.dart';

class SocialStatusRepository implements BaseSocialStatusRepository {
  SocialStatusRepository(this._dataSource);
  BaseRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, List<SocialStatus>>> getAllSocialStatues() async {
    try {
      var list = await _dataSource.getAllSocialStatues();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> add({required String title}) async {
    return await _dataSource.add(title: title);
  }

  @override
  Future<Either<Failure, Unit>> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update() {
    // TODO: implement update
    throw UnimplementedError();
  }
}
