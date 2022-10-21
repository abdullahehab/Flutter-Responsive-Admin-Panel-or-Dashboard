import 'package:admin/core/error/failures.dart';
import 'package:admin/features/owning/data/models/owning_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/owning.dart';
import '../../domain/repositories/base_owning_repository.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';

class OwningRepository implements BaseOwningRepository {
  OwningRepository(this._dataSource, this._localDataSource);
  OwningBaseRemoteDataSource _dataSource;
  OwningBaseLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Owning>>> getAllOwning(
      {required bool restoreData}) async {
    if (restoreData) {
      await _localDataSource.deleteAll();
    }

    var cachedList = await _localDataSource.getCachedOwningList();
    if (cachedList.length > 0) {
      print('get owning => cash');
      return Right(cachedList);
    }

    try {
      print('get owning => api');
      var list = await _dataSource.getOwning();
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
  Future<Either<Failure, Unit>> update({required Owning model}) async {
    OwningModel owningModel = OwningModel(id: model.id, title: model.title);

    try {
      await _dataSource.update(model: owningModel);

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
