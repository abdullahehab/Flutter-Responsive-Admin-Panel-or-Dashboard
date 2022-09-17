import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatefulWidget {
  const AppDialog(
      {Key? key, required this.child, required this.title, this.height})
      : super(key: key);

  final Widget child;
  final String title;
  final double? height;
  @override
  State<StatefulWidget> createState() => AppDialogState();
}

class AppDialogState extends State<AppDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));

    scaleAnimation = CurvedAnimation(
        parent: controller!, curve: Curves.fastLinearToSlowEaseIn);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
              scale: scaleAnimation!,
              child: Container(
                  height: widget.height ?? 430,
                  width: 700,
                  decoration: ShapeDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(APP_BORDER_RADIUS))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: widget.child,
                      )
                    ],
                  ))),
        ),
      ),
    );
  }
}
