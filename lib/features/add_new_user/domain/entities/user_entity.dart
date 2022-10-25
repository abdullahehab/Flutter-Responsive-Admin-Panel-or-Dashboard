import '../../../../core/constants/constants.dart';

class UserEntity {
  UserEntity({
    this.address,
    this.birthDate,
    this.childrenNumber,
    this.gender = 'ذكر',
    this.healthStatus = 'غير مريض',
    this.housing,
    this.educationalLevel,
    this.recruitment,
    this.husbandId,
    this.nationalId,
    this.owning,
    this.parentId,
    this.phone,
    this.socialStatus = 'اعزب',
    this.type = 'سليم',
    this.name,
    this.working,
  });

  String? nationalId;
  String? address;
  String? name;
  String? gender;
  String? husbandId;
  String? parentId;
  String? educationalLevel;
  String? recruitment;
  String? socialStatus;
  int? birthDate;
  String? phone;
  String? working;
  String? healthStatus;
  String? type;
  int? childrenNumber;
  String? housing;
  String? owning;
}
