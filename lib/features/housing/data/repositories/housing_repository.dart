import 'package:admin/core/error/failures.dart';
import 'package:admin/features/housing/data/models/housing_model.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/housing.dart';
import '../../domain/repositories/base_housing_repository.dart';
import '../datasource/local_datasource.dart';
import '../datasource/remote_datasource.dart';

class HousingRepository implements BaseHousingRepository {
  HousingRepository(this._dataSource, this._localDataSource);
  HousingBaseRemoteDataSource _dataSource;
  HousingBaseLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, List<Housing>>> getAllHousings(
      {required bool restoreData}) async {
    if (restoreData) {
      await _localDataSource.deleteAll();
    }

    var cachedList = await _localDataSource.getCachedHousingsList();
    if (cachedList.length > 0) {
      print('get housing => cash');
      return Right(cachedList);
    }

    try {
      print('get housing => api');
      var list = await _dataSource.getHousings();
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
  Future<Either<Failure, Unit>> update({required Housing model}) async {
    HousingModel housingModel = HousingModel(id: model.id, title: model.title);

    try {
      await _dataSource.update(model: housingModel);

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
      return Left(ServerFailure(mess: 'لم يتم حذف الحالة بكشل صحيح'));
    }
  }
}
