import 'package:flutter/material.dart';

extension WidgetX on Widget {

  Widget setCenter() {
    return Center(
      child: this,
    );
  }

  Widget setWidth(double width) {
    return Container(width: width, child: this);
  }

  Widget disableBackButton() {
    return WillPopScope(
      child: this,
      onWillPop: () async => false,
    );
  }

  Widget setHeight(double height) {
    return Container(height: height, child: this);
  }

  // Widget shimmerWhenLoading(bool loading,
  //     {Color? baseColor, Color? highlightColor, Duration? duration}) {
  //   if (loading ?? false) {
  //     return Shimmer.fromColors(
  //       period: duration ?? Duration(milliseconds: 1000),
  //       direction: ShimmerDirection.rtl,
  //       baseColor: baseColor ?? Colors.grey[300],
  //       highlightColor: highlightColor ?? Colors.grey[100],
  //       child: this,
  //     );
  //   }
  //   return this;
  // }
}
