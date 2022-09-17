class UserEntity {
  UserEntity({
    this.address,
    this.birthDate,
    this.childrenNumber,
    this.gender,
    this.healthStatus,
    this.housing,
    this.husbandId,
    this.nationalId,
    this.owning,
    this.parentId,
    this.phone,
    this.socialStatus,
    this.name,
    this.working,
  });

  String? nationalId;
  String? address;
  String? name;
  String? gender;
  String? husbandId;
  String? parentId;
  int? socialStatus;
  int? birthDate;
  String? phone;
  String? working;
  int? healthStatus;
  int? childrenNumber;
  String? housing;
  String? owning;
}
