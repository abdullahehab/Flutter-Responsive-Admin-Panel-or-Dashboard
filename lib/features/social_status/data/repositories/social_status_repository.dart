import 'package:admin/core/error/failures.dart';
import 'package:admin/features/social_status/data/datasource/local_datasource.dart';
import 'package:admin/features/social_status/data/datasource/remote_datasource.dart';
import 'package:admin/features/social_status/data/models/social_status_model.dart';

import 'package:admin/features/social_status/domain/entities/social_status.dart';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../domain/repositories/base_social_status_repository.dart';

class SocialStatusRepository implements BaseSocialStatusRepository {
  SocialStatusRepository(this._dataSource, this._localDataSource);
  BaseRemoteDataSource _dataSource;
  BaseLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<SocialStatus>>> getAllSocialStatues() async {
    var cachedList = await _localDataSource.getCachedSocialStatues();
    if (cachedList.length > 0) {
      return Right(cachedList);
    }

    try {
      var list = await _dataSource.getAllSocialStatues();
      if (list.length > 0) {
        for (var value in list) {
          _localDataSource.insert(model: value);
        }
      }
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(mess: ''));
    }
  }

  @override
  Future<Either<Failure, Unit>> add({required String title}) async {
    try {
      await _dataSource.add(title: title);
      await _localDataSource.insert(
          model: SocialStatusModel(
              id: DateTime.now().millisecondsSinceEpoch, title: title));
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: ''));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAll() {
    return _dataSource.deleteAll();
  }

  @override
  Future<Either<Failure, Unit>> update({required SocialStatus model}) {
    SocialStatusModel socialStatusModel =
        SocialStatusModel(id: model.id, title: model.title);

    return _dataSource.update(model: socialStatusModel);
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required String id}) {
    return _dataSource.deleteItem(id: id);
  }
}
