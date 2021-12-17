// @dart=2.9

import 'package:admin/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:admin/extensions/extension.dart';

import '../constants.dart';
import 'get_date_from_picker_dialog.dart';

typedef DateFormatter = String Function(DateTime dateTime);

class DateSelector extends StatefulWidget {
  const DateSelector({
    Key key,
    this.timeStyle,
    this.withIcon = false,
    this.dateTime,
    this.imageSvgColor,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.hintKey,
    this.imageAssetsSvg,
    this.outsideHintText,
    this.onSaved,
    this.onChanged,
    this.prefixIcon,
    this.enable = true,
    this.dateFormatter,
  }) : super(key: key);
  final String imageAssetsSvg;
  final Color imageSvgColor;
  final DateTime dateTime;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final TextStyle timeStyle;
  final bool withIcon;
  final FormFieldSetter<DateTime> onSaved;
  final FormFieldSetter<DateTime> onChanged;
  final String hintKey;
  final DateFormatter dateFormatter;
  final String outsideHintText;
  final Widget prefixIcon;
  final bool enable;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  final ValueNotifier<DateTime> dateNotifier = ValueNotifier<DateTime>(null);

  String _defaultDateFormatter(DateTime dateTime) {
    return dateTime.toDateOnly();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DateTime>(
      valueListenable: dateNotifier,
      builder: (context, value, child) {
        return FormField<DateTime>(
          initialValue: widget.dateTime,
          onSaved: (DateTime newValue) {
            if (widget.onSaved != null) widget.onSaved(newValue);
          },
          validator: (DateTime val) {
            final isValid = (val ?? widget.dateTime).toString().isEmpty;
            if (!isValid) {
              return 'برجاء إختيار تاريخ الميلاد';
            }

            return null;
          },
          builder: (FormFieldState<DateTime> field) {
            final DateTime _date = value ?? field?.value ?? widget.dateTime;

            final bool isEmpty = _date == null;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: widget.enable
                      ? () async {
                          final DateTime data = await getDateFromPickerDialog(
                              context, PickerSelectionMode.single,
                              initialDate: widget.initialDate,
                              maxDate: widget.lastDate,
                              minDate: widget.firstDate);
                          if (data != null) {
                            dateNotifier.value = data;
                            field.validate();
                            field.setValue(value);
                            field.didChange(value);
                            if (widget.onChanged != null)
                              widget.onChanged.call(value);
                          }
                        }
                      : null,
                  child: Container(
                    height: 43.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: field.hasError
                              ? Colors.red
                              : AppColor.kPrimaryDarkColor),
                      borderRadius: BorderRadius.all(
                        Radius.circular(APP_BORDER_RADIUS),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                            child: Row(
                          children: [
                            if (widget.withIcon == true)
                              widget.prefixIcon ?? calenderIcon(),
                            Text(
                              isEmpty
                                  ? (widget.hintKey ?? 'تاريخ الميلاد')
                                  : (widget.dateFormatter ??
                                      _defaultDateFormatter)(_date),
                            )
                          ],
                        )),
                        if (widget.imageAssetsSvg != null)
                          SvgPicture.asset(
                            widget.imageAssetsSvg,
                            color:
                                widget.imageSvgColor ?? const Color(0xffa0a0b6),
                            placeholderBuilder: (_) =>
                                CupertinoActivityIndicator(),
                          ),
                      ],
                    ).addPaddingHorizontalVertical(horizontal: 10),
                  ),
                ),
                (field.hasError)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            field?.errorText ?? '',
                            style: TextStyle(
                              fontSize: 10.h,
                              height: 1.6,
                              color: Colors.red.shade800,
                            ),
                          ).addPaddingHorizontalVertical(horizontal: 8),
                        ],
                      )
                    : const SizedBox(),
              ],
            );
          },
        );
      },
    );
  }

  Widget calenderIcon() {
    return Row(
      children: const <Widget>[
        Icon(
          Icons.calendar_today_outlined,
          color: Color(0xFFA0A0B4),
          size: 18,
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
