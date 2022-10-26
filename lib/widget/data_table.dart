import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget dataTable({
  required List<DataColumn> columns,
  required List<DataRow> rows,
  double? rowHeight,
}) {
  return LayoutBuilder(builder: (_, __) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Get.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          headingRowHeight: 45,
          headingTextStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffFED385),
            fontWeight: FontWeight.w700,
            fontFamily: 'cairo',
          ),
          columnSpacing: 0,
          dataRowHeight: rowHeight ?? 50,
          dataTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'cairo',
          ),
          headingRowColor: MaterialStateColor.resolveWith(
            (states) {
              return Color(0xff41A2D8);
            },
          ),
          columns: columns,
          rows: rows,
        ),
      ),
    );
  });
}
