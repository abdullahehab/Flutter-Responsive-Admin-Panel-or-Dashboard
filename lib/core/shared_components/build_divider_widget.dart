import 'package:flutter/material.dart';

class DividerX extends StatelessWidget {
  const DividerX({Key? key, this.padding, this.color}) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        width: double.infinity,
        height: 1,
        color: color ?? Colors.grey.withOpacity(0.2),
      ),
    );
  }
}
