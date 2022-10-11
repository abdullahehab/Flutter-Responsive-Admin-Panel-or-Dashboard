import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        height: 1,
      ),
    );
  }
}
