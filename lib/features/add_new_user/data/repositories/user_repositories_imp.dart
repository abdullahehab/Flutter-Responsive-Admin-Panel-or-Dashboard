import 'package:admin/core/error/failures.dart';
import 'package:admin/features/add_new_user/data/datasource/remote_datasource.dart';
import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:admin/features/add_new_user/domain/repositories/user_repository.dart';
import 'package:admin/models/user_model.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp implements UserRepository {
  UserRepositoryImp(this.remoteDataSourceImp);
  UserRemoteDataSourceImp remoteDataSourceImp;

  @override
  Future<Either<Failure, Unit>> addUser(UserEntity user) {
    UserModel userModel = UserModel(
        nationalId: user.nationalId,
        name: user.name,
        address: user.address,
        husbandId: user.husbandId,
        socialStatus: user.socialStatus,
        birthDate: user.birthDate,
        phone: user.phone,
        working: user.working,
        healthStatus: user.healthStatus,
        type: user.type,
        childrenNumber: user.childrenNumber,
        housing: user.housing,
        parentId: user.parentId,
        owning: user.owning,
        gender: user.gender,
        recruitment: user.recruitment,
        educationalLevel: user.educationalLevel);

    return remoteDataSourceImp.addUser(userModel);
  }

  @override
  Future<Either<Failure, Unit>> updateUser(UserEntity user) {
    UserModel userModel = UserModel(
        nationalId: user.nationalId,
        name: user.name,
        address: user.address,
        husbandId: user.husbandId,
        socialStatus: user.socialStatus,
        birthDate: user.birthDate,
        phone: user.phone,
        working: user.working,
        healthStatus: user.healthStatus,
        type: user.type,
        childrenNumber: user.childrenNumber,
        housing: user.housing,
        parentId: user.parentId,
        owning: user.owning,
        gender: user.gender,
        recruitment: user.recruitment,
        educationalLevel: user.educationalLevel);

    return remoteDataSourceImp.updateUser(userModel);
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getAllUsers() {
    return remoteDataSourceImp.getAllUsers();
  }

  @override
  Future<Either<Failure, Unit>> delete(String userId) {
    return remoteDataSourceImp.delete(userId);
  }
}
