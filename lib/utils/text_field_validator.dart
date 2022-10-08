import 'package:admin/utils/validator.dart';

class TextFieldValidators {
  static String? isName(String? name) {
    if (Validator.isName(name!)) return null;
    return 'برجاء إدخال الاسم كامل';
  }

  static String? isFullName(String name) {
    if (Validator.isFullName(name)) return null;
    return 'please_enter_your_full_name';
  }

  static String? isNationalId(String? nationalId) {
    if (Validator.isNationalId(nationalId!)) return null;
    return 'برجاء إدخال الرقم القومي بشكل صحيح';
  }

  static String? isPhone(String? phone) {
    if (Validator.isPhone(phone!)) return null;
    return 'برجاء إدخال رقم الهاتف';
  }

  static String? isVerificationCode(String code, {String? message}) {
    if (Validator.isVerificationCode(code)) return null;
    return message ?? 'the_code_is_not_valid';
  }

  static String? isNotEmpty(String? value) {
    if (Validator.isNotEmpty(value!)) return null;
    return 'برجاء إدخال البيانات';
  }

  static String? dateIsNotEmpty(int? value) {
    if (Validator.dateIsNotEmpty(value!)) return null;
    return 'برجاء إدخال تاريخ الميلاد';
  }

  static String? isBirthDate(String value) {
    if (Validator.isNotEmpty(value)) return null;
    return 'برجاء إدخال تاريخ الميلاد';
  }

  static String? isSocialStatus(String? value) {
    if (Validator.isNotEmpty(value!)) return null;
    return 'برجاء إختيار الحالة الاجتماعية';
  }

  static String? isHealthStatus(String? value) {
    if (Validator.isNotEmpty(value!)) return null;
    return 'برجاء إختيار الحالة الصحية';
  }

  static String? isPassword(String password) {
    if (Validator.isPassword(password)) return null;
    return 'the_password_must_be_characters_or_more';
  }

  static String? confirmPasswordValidator(
      String password, String confirmPassword) {
    if (confirmPassword != password) {
      return 'the_password_must_be_identical';
    }
    return null;
  }

  static String? isAddress(String? address) {
    if (Validator.isAddress(address!)) return null;
    return 'برجاء إدخال العنوان كامل بشكل تفصيلا';
  }

  static String? isIdNumber(String idNumber) {
    if (Validator.isIdNumber(idNumber)) return null;
    return 'the_id_number_must_be_not_empty';
  }
}
