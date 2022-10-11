import 'package:flutter/material.dart';

DataCell dataCellItem({required String data}) {
  if (data == 'null') data = '-';
  if (data == '') data = '-';
  return DataCell(
    Text(
      data,
    ),
  );
}
