import 'package:flutter/material.dart';

DataColumn dataColumnItem({required String title}) {
  return DataColumn(
    label: Text(
      title,
      textAlign: TextAlign.center,
    ),
  );
}
