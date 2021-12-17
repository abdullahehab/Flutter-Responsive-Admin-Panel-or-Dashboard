// @dart=2.9
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:admin/extensions/extension.dart';
enum PickerSelectionMode {
  single,
  range,
}

Future<dynamic> getDateFromPickerDialog(
    BuildContext context, PickerSelectionMode pickerSelectionMode,
    {DateTime minDate, DateTime maxDate, DateTime initialDate}) async {
  final _initialDate =
      initialDate ?? DateTime.now().add(const Duration(days: 1));
  PickerDateRange range;
  DateTime dateTime = _initialDate;

  return await showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SfDateRangePicker(
                  selectionMode:
                      pickerSelectionMode == PickerSelectionMode.range
                          ? DateRangePickerSelectionMode.range
                          : DateRangePickerSelectionMode.single,
                  headerStyle: DateRangePickerHeaderStyle(
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                  initialDisplayDate: _initialDate,
                  initialSelectedDate: _initialDate,
                  minDate:
                      minDate ?? DateTime.now().add(const Duration(days: 1)),
                  maxDate: maxDate ??
                      DateTime.now().add(const Duration(days: 300 * 2)),
                  onSelectionChanged: (DateRangePickerSelectionChangedArgs
                      dateRangePickerSelectionChangedArgs) {
                    if (pickerSelectionMode == PickerSelectionMode.range) {
                      range = dateRangePickerSelectionChangedArgs.value
                          as PickerDateRange;
                    } else {
                      dateTime =
                          dateRangePickerSelectionChangedArgs.value as DateTime;
                    }
                  },
                ).addPaddingAll(6),
                ButtonBarTheme(
                  data: ButtonBarTheme.of(context),
                  child: ButtonBar(
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          elevation: 0.0.toMaterialStateProperty(),
                        ),
                        child: Text(
                          'الغاء',
                        ),
                        onPressed: () => Navigator.pop(context, null),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          elevation: 0.0.toMaterialStateProperty(),
                        ),
                        child: Text('تم'),
                        onPressed: () {
                          Navigator.pop(
                              context,
                              pickerSelectionMode == PickerSelectionMode.range
                                  ? range
                                  : dateTime);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
