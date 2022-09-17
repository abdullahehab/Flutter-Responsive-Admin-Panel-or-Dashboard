import 'package:easy_localization/easy_localization.dart';

extension Strings on String {
  bool isEmptyOrNull() {
    if (this == 'null') return true;
    return this.isEmpty;
  }

  bool get isNotEmptyOrNull => !isEmptyOrNull();

  double toDouble() => double.parse(this);
  int toInt() => int.parse(this);

  String dateFromString() {
    return DateFormat('dd/MM/yyyy')
        .format(
          DateTime.parse(this),
        )
        .toString();
  }
}
