import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants.dart';
import '../../utils/colors.dart';

class DropDownWidgetX<T> extends StatefulWidget {
  const DropDownWidgetX(
      {Key? key,
      this.labelText,
      this.hintText,
      this.maxHeight,
      this.fieldHeight,
      this.fieldWidth,
      this.maxWidth,
      this.items,
      this.onChanged,
      this.itemAsString,
      this.requiredFiled = false,
      this.enabled = true,
      this.selectedItem})
      : super(key: key);

  final String? labelText;
  final String? hintText;
  final double? maxHeight;
  final double? fieldHeight;
  final double? fieldWidth;
  final double? maxWidth;
  final List<T>? items;
  final Function(T?)? onChanged;
  final bool requiredFiled;
  final bool enabled;
  final T? selectedItem;
  final DropdownSearchItemAsString<T>? itemAsString;

  @override
  State<DropDownWidgetX<T>> createState() => _DropDownWidgetXState<T>();
}

class _DropDownWidgetXState<T> extends State<DropDownWidgetX<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Row(
            children: [
              Text(
                widget.labelText!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              widget.requiredFiled
                  ? Text(
                      '*',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        height: 1,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        SizedBox(height: 5.h),
        Container(
          height: widget.fieldHeight ?? 43.h,
          width: widget.fieldWidth,
          child: DropdownSearch<T>(
            enabled: widget.enabled,
            maxHeight: widget.maxHeight,
            dialogMaxWidth: widget.maxWidth,
            mode: Mode.MENU,
            showSelectedItems: false,
            items: widget.items!,
            selectedItem: widget.selectedItem,
            itemAsString: widget.itemAsString,
            dropdownSearchDecoration: InputDecoration(
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                filled: true,
                hintText: widget.hintText == null
                    ? widget.labelText
                    : widget.hintText,
                border: border,
                enabledBorder: border,
                focusedBorder: border),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }

  InputBorder? border = OutlineInputBorder(
      borderSide: BorderSide(color: AppColor.kPrimaryDarkColor),
      borderRadius: BorderRadius.circular(APP_BORDER_RADIUS));
}
