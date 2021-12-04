import 'package:flutter/material.dart';

extension Strings on String {

  bool isEmptyOrNull() => this.isEmpty;

  double toDouble() => double.parse(this);
  int toInt() => int.parse(this);
}