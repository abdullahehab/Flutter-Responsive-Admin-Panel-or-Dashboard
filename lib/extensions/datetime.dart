import 'package:intl/intl.dart';

import 'package:jiffy/jiffy.dart';
const String patternCheckInCheckOut = 'EE[,] d MMM'; //=> Sat, 30 Nov
const String patternDDMMYYY = 'dd-MM-yyyy';
const String patternYYYYMMDD = 'yyyy-MM-dd';

const String mdYYYY = 'MMM d[,] yyyy'; //=> May 4, 2020
const String hMmAAA = 'hh:mm aaa'; //=> 2:15PM

extension CheckInCheckOutDateTime on DateTime {
  String toCheckInCheckOut() {
    if (this == null) return '';

    return Jiffy(this).format(patternCheckInCheckOut);
  }

  String toReviewsDate() {
    if (this == null) {
      return '';
    }
    return Jiffy(this).format(hMmAAA) + '\n' + Jiffy(this).format(mdYYYY);
  }

  String fromTimeAgo() {
    if (this == null) {
      return '';
    }

    return Jiffy(this).fromNow();
  }

  String toReviewsOnlyDate() {
    if (this == null) {
      return '';
    }
    return Jiffy(this).format(mdYYYY);
  }

  String toDateOnly() {
    return Jiffy(this).format(patternDDMMYYY);
  }

  String? toYYYYMMDDWithOutLocalization() {
    if (this == null) return null;

    final DateFormat f = DateFormat(patternYYYYMMDD, 'en');
    return f.format(this);
  }

  String? toDDMMYYYWithOutLocalization() {
    if (this == null) return null;

    final DateFormat f = DateFormat(patternDDMMYYY, 'en');
    return f.format(this);
  }

  String toTime() {
    if (this == null) {
      return '';
    }
    return Jiffy(this).format(hMmAAA);
  }
}
