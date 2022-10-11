import '../../../../core/constants/constants.dart';

class UserEntity {
  UserEntity({
    this.address,
    this.birthDate,
    this.childrenNumber,
    this.gender = 'ذكر',
    this.healthStatus = 1,
    this.housing,
    this.husbandId,
    this.nationalId,
    this.owning,
    this.parentId,
    this.phone,
    this.socialStatus = 'اعزب',
    this.name,
    this.working,
  });

  String? nationalId;
  String? address;
  String? name;
  String? gender;
  String? husbandId;
  String? parentId;
  String? socialStatus;
  int? birthDate;
  String? phone;
  String? working;
  int? healthStatus;
  int? childrenNumber;
  String? housing;
  String? owning;
}
