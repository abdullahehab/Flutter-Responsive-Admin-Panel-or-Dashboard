import 'package:admin/extensions/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularLoad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CircularLoadState();
}

class CircularLoadState extends State<CircularLoad>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250))
      ..forward(from: 0.0);

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: ScaleTransition(
        scale: _controller!,
        child: Center(
          child: Container(
            height: 80.w,
            width: 80.w,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                )),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ),
            ),
          ).addPaddingAll(30),
        ),
      ),
    );
  }
}
