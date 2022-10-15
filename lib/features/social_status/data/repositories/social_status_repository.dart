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
  Future<Either<Failure, Unit>> deleteAll() async {
    try {
      await _dataSource.deleteAll();
      await _localDataSource.deleteAll();
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم الحذف الكلي بشكل صحيح'));
    }
  }

  @override
  Future<Either<Failure, Unit>> update({required SocialStatus model}) async {
    SocialStatusModel socialStatusModel =
        SocialStatusModel(id: model.id, title: model.title);

    try {
      await _dataSource.update(model: socialStatusModel);
      _localDataSource.update(model: socialStatusModel);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم التعديل بشكل صحيح'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required String id}) async {
    try {
      await _dataSource.deleteItem(id: id);
      await _localDataSource.deleteItem(id: id);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم حذف الحاله بكشل صحيح'));
    }
  }
}
