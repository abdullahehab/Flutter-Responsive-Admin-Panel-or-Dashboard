import 'dart:convert';

import 'package:admin/features/add_new_user/domain/entities/user_entity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../core/constants/constants.dart';

class UserModel extends UserEntity {
  UserModel({
    this.nationalId,
    this.name,
    this.address,
    this.husbandId,
    this.socialStatus = 'اعزب',
    this.birthDate,
    this.phone,
    this.working,
    this.healthStatus = 'غير مريض',
    this.type = 'سليم',
    this.childrenNumber,
    this.housing,
    this.parentId,
    this.owning,
    this.gender = 'ذكر',
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
  String? socialStatus;
  int? birthDate;
  String? phone;
  String? working;
  String? healthStatus;
  String? type;
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
      birthDate: json["birthDate"],
      phone: json["phone"],
      working: json["working"],
      healthStatus: json["healthStatus"],
      childrenNumber: json["childrenNumber"],
      housing: json["housing"],
      owning: json["owning"],
      name: json["name"],
      gender: json['gender'],
      type: json['type']);

  Map<String, dynamic> toJson() => {
        "nationalId": nationalId,
        "name": name,
        "address": address,
        "parentId": parentId,
        "husbandId": husbandId,
        "socialStatus": socialStatus,
        "birthDate": birthDate,
        "phone": phone,
        "working": working,
        "healthStatus": healthStatus,
        "childrenNumber": childrenNumber,
        "housing": housing,
        "owning": owning,
        "type": type,
        "gender": gender
      };

  @override
  String toString() {
    return '{nationalId: $nationalId, address: $address, name: $name, gender: $gender, husbandId: $husbandId, parentId: $parentId, socialStatus: $socialStatus, birthDate: $birthDate, phone: $phone, working: $working, healthStatus: $healthStatus, childrenNumber: $childrenNumber, housing: $housing, owning: $owning}';
  }
}
