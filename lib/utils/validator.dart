import '../core/constants/constants.dart';
import 'package:admin/extensions/extension.dart';

class Validator {
  static bool isEGPhoneNumber(String phone) {
    if (phone == null || phone.isEmpty) {
      return false;
    }

    final RegExp exp = RegExp(egPhoneRegex);
    return exp.hasMatch(phone);
  }

  static bool isValid(String value) {
    return value.isNotEmpty;
  }

  static bool isNotEmpty(String value) {
    return !value.isEmptyOrNull();
  }

  static bool dateIsNotEmpty(int value) {
    return !value.toString().isEmptyOrNull();
  }

  static bool isSmsCode(String code) {
    return code.length == 5;
  }

  static bool isVerificationCode(String code) {
    return code.length == 4;
  }

  static bool isPassword(String password) {
    return password.length > 7;
  }

  static bool isPassport(String password) {
    return password.isNotEmpty && password.length == 8;
  }

  static bool isArName(String name) {
    // en name
    // final RegExp nameRegExp = RegExp(r'^[a-z]+$');

    // ar name
    final RegExp nameRegExp = RegExp(r'[\u0621-\u064A]+$');

    return name.length >= 3 && nameRegExp.hasMatch(name);
  }

  static bool isFullName(String? name) {
    final names = (name ?? '').split(' ');
    return (names.length >= 2) &&
        names.every((element) => element.isNotEmptyOrNull);
  }

  static bool isAddress(String address) {
    return address.isNotEmpty;
  }

  static bool isPhone(String phone) {
    return phone.isNotEmpty && phone.length == 11;
  }

  static bool isNationality(String nationality) {
    return nationality.isNotEmpty;
  }

  static bool isIdNumber(String idNumber) {
    return idNumber.isNotEmpty;
  }

  static bool isDestination(String destination) {
    return destination.isNotEmpty;
  }

  static bool isIdExpireDate(String expireDate) {
    return expireDate.isNotEmpty;
  }

  static bool isCountry(String address) {
    return address.isNotEmpty;
  }

  static bool isMasterCardNumber(String masterCard) {
    // TODO(andelrahman): validate with regex
    return masterCard.isNotEmpty && masterCard.length == 16;
  }

  static bool isYearNumber(String digitNumber) {
    return digitNumber.isNotEmpty && digitNumber.length == 4;
  }

  static bool isAmount(String amount) {
    return amount.isNotEmpty;
  }

  static bool isTwoDigitNumber(String digitNumber) {
    return digitNumber.isNotEmpty && digitNumber.length == 2;
  }

  static bool isThreeDigitNumber(String digitNumber) {
    return digitNumber.isNotEmpty && digitNumber.length == 3;
  }

  static bool isNationalId(String nationalId) {
    return nationalId.isNotEmpty && nationalId.length == 14;
  }

  static bool isCardHeaderNameNumber(String name) {
    return name.isNotEmpty && name.length > 2;
  }

  static bool isCodeCorrect(String codeFromUser, String correctCode) {
    if (!Validator.isSmsCode(codeFromUser)) {
      return false;
    }

    final String codeFromUserReversed = codeFromUser.split('').reversed.join();

    if (codeFromUser == correctCode || codeFromUserReversed == correctCode) {
      return true;
    }

    return false;
  }
}
