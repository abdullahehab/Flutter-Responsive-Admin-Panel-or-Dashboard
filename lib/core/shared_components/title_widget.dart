import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title, this.titleWidget})
      : super(key: key);

  final String? title;
  final Widget? titleWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          if (titleWidget != null) titleWidget!
        ],
      ),
    );
  }
}
