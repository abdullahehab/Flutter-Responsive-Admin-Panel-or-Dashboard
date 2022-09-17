import 'dart:convert';

import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    this.nationalId,
    this.name,
    this.address,
    this.husbandId,
    this.socialStatus,
    this.personalStatus,
    this.birthDate,
    this.phone,
    this.working,
    this.healthStatus,
    this.childrenNumber,
    this.housing,
    this.parentId,
    this.owning,
    this.gender,
  }) : super(
            nationalId: nationalId,
            address: address,
            name: name,
            gender: gender,
            husbandId: husbandId,
            parentId: parentId,
            socialStatus: socialStatus,
            birthDate: birthDate,
            phone: phone,
            working: working,
            healthStatus: healthStatus,
            childrenNumber: childrenNumber,
            housing: housing,
            owning: owning);

  String? nationalId;
  String? address;
  String? name;
  String? gender;
  String? husbandId;
  String? parentId;
  int? socialStatus;
  int? personalStatus;
  int? birthDate;
  String? phone;
  String? working;
  int? healthStatus;
  int? childrenNumber;
  String? housing;
  String? owning;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nationalId: json["nationalId"],
        address: json["address"],
        parentId: json["parentId"],
        husbandId: json["husbandId"],
        socialStatus: json["socialStatus"],
        personalStatus: json["personalStatus"],
        birthDate: json["birthDate"],
        phone: json["phone"],
        working: json["working"],
        healthStatus: json["healthStatus"],
        childrenNumber: json["childrenNumber"],
        housing: json["housing"],
        owning: json["owning"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "nationalId": nationalId,
        "address": address,
        "parentId": parentId,
        "husbandId": husbandId,
        "socialStatus": socialStatus,
        "personalStatus": personalStatus,
        "birthDate": birthDate,
        "phone": phone,
        "working": working,
        "healthStatus": healthStatus,
        "childrenNumber": childrenNumber,
        "housing": housing,
        "owning": owning,
      };
}
