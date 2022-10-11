import 'package:admin/core/shared_components/title_widget.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/colors.dart';


class StyledContent extends StatelessWidget {
  const StyledContent(
      {Key? key,
      this.title,
      this.titleWidget,
      this.subTitle,
      required this.children,
      this.padding,
      this.footer,
      this.leadingWidget})
      : super(key: key);

  final String? title;
  final Widget? titleWidget;
  final String? subTitle;
  final List<Widget> children;
  final Widget? footer;
  final Widget? leadingWidget;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) TitleWidget(title: title, titleWidget: titleWidget),
        Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    offset: const Offset(0, 0),
                  ),
                ],
                border: Border.all(color:AppColor. borderColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(kTextFiledBorderRadius)),
            width: double.infinity,
            child: Column(
              children: [
                if (subTitle != null)
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF6FBFF),
                        border: Border(
                          top: BorderSide(color: Color(0xffEEF1F4)),
                          bottom: BorderSide(color: Color(0xffEEF1F4)),
                        )),
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(subTitle!),
                          if (leadingWidget != null) leadingWidget!
                        ],
                      ),
                    ),
                  ),
                ...children.toList(),
                if (footer != null)
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: footer,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        color: Color(0xfff5f7fa),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(kTextFiledBorderRadius),
                          bottomRight: Radius.circular(kTextFiledBorderRadius),
                        )),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
