import 'package:admin/core/error/failures.dart';
import 'package:admin/features/working/data/models/work_model.dart';
import 'package:admin/features/working/domain/entities/work.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/base_work_repository.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';

class WorkRepository implements BaseWorkRepository {
  WorkRepository(this._dataSource, this._localDataSource);
  WorkBaseRemoteDataSource _dataSource;
  WorkBaseLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Work>>> getAllWorks(
      {required bool restoreData}) async {
    if (restoreData) {
      await _localDataSource.deleteAll();
    }

    var cachedList = await _localDataSource.getCachedWorkList();
    if (cachedList.length > 0) {
      print('get work => cash');
      return Right(cachedList);
    }

    try {
      print('get work => api');
      var list = await _dataSource.getWorks();
      if (list.length > 0) {
        for (var value in list) {
          await _localDataSource.insert(model: value);
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
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: ''));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAll() async {
    try {
      await _dataSource.deleteAll();
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم الحذف الكلي بشكل صحيح'));
    }
  }

  @override
  Future<Either<Failure, Unit>> update({required Work model}) async {
    WorkModel socialStatusModel = WorkModel(id: model.id, title: model.title);

    try {
      await _dataSource.update(model: socialStatusModel);

      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم التعديل بشكل صحيح'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required String id}) async {
    try {
      await _dataSource.deleteItem(id: id);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(mess: 'لم يتم حذف الحاله بكشل صحيح'));
    }
  }
}
