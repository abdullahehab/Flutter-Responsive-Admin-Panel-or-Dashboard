import 'package:admin/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CloudStorageInfo {
  final String? svgSrc, title;
  final int? number;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.color,
    this.number,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "المطلقات",
    number: 1328,
    svgSrc: "assets/icons/Documents.svg",
    color: primaryColor,
  ),
  CloudStorageInfo(
    title: "الارامل",
    number: 1328,
    svgSrc: "assets/icons/google_drive.svg",
    color: Color(0xFFFFA113),
  ),
  CloudStorageInfo(
    title: "الايتام",
    number: 1328,
    svgSrc: "assets/icons/one_drive.svg",
    color: Color(0xFFA4CDFF),
  ),
  CloudStorageInfo(
    title: "الصغار",
    number: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    color: Color(0xFF007EE5),
  ),
];
