import 'package:flutter/material.dart';

Widget app_error(String? message) {
  return Scaffold(
    body: Center(
      child: Text(message.toString()),
    ),
  );
}
