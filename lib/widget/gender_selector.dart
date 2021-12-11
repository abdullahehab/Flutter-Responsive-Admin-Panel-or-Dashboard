import 'package:admin/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';

import '../constants.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
    @required this.onSaved,
    this.onChanged,
    this.initValue,
  });
  final FormFieldSetter<String>? onSaved;
  final FormFieldSetter<String>? onChanged;
  final String? initValue;

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  final ValueNotifier<String> genderNotifier =
      ValueNotifier<String>(genderKeys[0]);

  _GenderSelectorState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      genderNotifier.value = widget.initValue ?? genderKeys[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      onSaved: (newValue) {
        widget.onSaved!(genderNotifier.value);
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الجنس',
            ).addPaddingHorizontalVertical(horizontal: 20),
            const SizedBox(height: 10),
            ValueListenableBuilder<String>(
              valueListenable: genderNotifier,
              builder: (BuildContext context, String gender, _) => SizedBox(
                width: context.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: genderKeys.map((String e) {
                    final selected = e == gender;
                    return Flexible(
                      child: InkWell(
                        onTap: () {
                          genderNotifier.value = e;
                          if (widget.onChanged != null) widget.onChanged!(e);
                        },
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                            color: selected ? AppColor.kPrimaryColor.withOpacity(.4) : null,
                            border: Border.all(color: AppColor.kPrimaryColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(APP_BORDER_RADIUS)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Radio<String>(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: e,
                                groupValue: gender,
                                activeColor: AppColor.kPrimaryDarkColor,
                                onChanged: (String? value) {
                                  genderNotifier.value = e;
                                  if (widget.onChanged != null) {
                                    widget.onChanged!(e);
                                  }
                                },
                              ),
                              Text(
                                e,
                              ),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ).addPaddingHorizontalVertical(
                              horizontal: 8, vertical: 4),
                        ),
                      ).addPaddingHorizontalVertical(horizontal: 16),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
