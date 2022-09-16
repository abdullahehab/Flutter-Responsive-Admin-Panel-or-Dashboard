import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin/extensions/extension.dart';

import '../constants.dart';
import 'package:get/get.dart';
class AppDropdownButton<T> extends StatelessWidget {
  const AppDropdownButton({
    Key? key,
    @required this.value,
    @required this.onChanged,
    @required this.items,
    this.selectedItemBuilder,
    this.outLineText,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.validator,
    this.showBlank = false,
    this.blankValue = '',
    this.enabled = true,
  }) : super(key: key);

  final String? labelText, outLineText, hintText;
  final dynamic value;
  final Function(dynamic)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final bool? showBlank;
  final bool? enabled;
  final dynamic blankValue;
  final DropdownButtonBuilder? selectedItemBuilder;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  @override
  Widget build(BuildContext context) {
    dynamic checkedValue = value;
    final values = items!.toList().map((option) => option.value).toList();
    if (!values.contains(value)) {
      checkedValue = blankValue;
    }

    Widget dropDownButton = Column(
      children: [
        FormField<String>(
            onSaved: (newValue) {
              if (onSaved != null) onSaved!(newValue);
            },
            validator: (String? value) {
              if (validator != null) {
                final String? valid = validator!(value ?? '');

                return valid;
              }

              return null;
            },
            builder: (FormFieldState<String>? field) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      outLineText!,
                    ),
                    SizedBox(height: 5),
                    DropdownButtonHideUnderline(
                      child: Container(
                        height: 43.h,
                        width: context.width,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(APP_BORDER_RADIUS),
                            border: Border.all(
                              color: field!.hasError
                                  ? Colors.red
                                  : AppColor.kPrimaryDarkColor,
                            )),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<T>(
                            hint: Text(
                              hintText!,
                            ),
                            value: value,
                            icon: const Icon(Icons.keyboard_arrow_down_rounded),
                            isExpanded: true,
                            onChanged: (dynamic newValue) {
                              field.setValue(newValue);
                              field.validate();
                              if (onChanged != null) onChanged!.call(newValue);
                            },
                            selectedItemBuilder: selectedItemBuilder,
                            items: [
                              if (showBlank!)
                                DropdownMenuItem<T>(
                                  value: checkedValue,
                                  child: SizedBox(),
                                ),
                              ...items!
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (validator != null)
                      (field.hasError)
                          ? Text(
                              '${field.errorText}',
                              style: TextStyle(
                                fontSize: 10.h,
                                height: 0.6,
                                color: Colors.red.shade800,
                              ),
                            ).addPaddingOnly(right: 0, top: 10)
                          : const SizedBox(
                              height: 0,
                            ),
                  ],
                )),
      ],
    );

    if (labelText != null) {
      dropDownButton = InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
          ),
          child: dropDownButton);
    }

    return dropDownButton;
  }
}
