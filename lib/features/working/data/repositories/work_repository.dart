import 'package:admin/core/error/failures.dart';
import 'package:admin/features/working/data/models/social_status_model.dart';
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
  Future<Either<Failure, List<Work>>> getAllWorks() async {
    var cachedList = await _localDataSource.getCachedWorkList();
    if (cachedList.length > 0) {
      return Right(cachedList);
    }

    try {
      var list = await _dataSource.getWorks();
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
          model: WorkModel(
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
  Future<Either<Failure, Unit>> update({required Work model}) {
    WorkModel workModel = WorkModel(id: model.id, title: model.title);

    return _dataSource.update(model: workModel);
  }

  @override
  Future<Either<Failure, Unit>> deleteItem({required String id}) {
    return _dataSource.deleteItem(id: id);
  }
}
