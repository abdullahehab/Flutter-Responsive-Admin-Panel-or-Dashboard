import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happytbooking_app/app/theme.dart';
import 'package:happytbooking_app/di/di.dart';
import 'package:happytbooking_app/extensions/extensions.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
    Key key,
    @required this.onSaved,
    this.onChanged,
    this.initValue,
  }) : super(key: key);
  final FormFieldSetter<String> onSaved;
  final FormFieldSetter<String> onChanged;
  final String initValue;

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  final ValueNotifier<String> genderNotifier =
      ValueNotifier<String>(Constants.genderKeys[0]);

  _GenderSelectorState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      genderNotifier.value = widget?.initValue ?? Constants.genderKeys[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      onSaved: (newValue) {
        widget.onSaved(genderNotifier.value);
      },
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'gender'.translate(),
              style: outLineTextStyle,
            ).addPaddingHorizontalVertical(horizontal: 6),
            const SizedBox(height: 10),
            ValueListenableBuilder<String>(
              valueListenable: genderNotifier,
              builder: (BuildContext context, String gender, _) => SizedBox(
                width: context.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: Constants.genderKeys.map((String e) {
                    final selected = e == gender;
                    return Flexible(
                      child: InkWell(
                        onTap: () {
                          genderNotifier.value = e;
                          if (widget.onChanged != null) widget.onChanged(e);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selected ? const Color(0xFFF1F4FB) : null,
                            border: Border.all(color: const Color(0xFFF3F7FF)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Radio<String>(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                value: e,
                                groupValue: gender,
                                onChanged: (String value) {
                                  genderNotifier.value = e;
                                  if (widget.onChanged != null) {
                                    widget.onChanged(e);
                                  }
                                },
                              ),
                              Text(
                                e.translate(),
                                style: regularTextStyle.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          ).addPaddingHorizontalVertical(
                              horizontal: 8, vertical: 4),
                        ),
                      ).addPaddingHorizontalVertical(horizontal: 8),
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
