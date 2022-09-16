import 'package:flutter/material.dart';
import 'package:admin/extensions/extension.dart';
import '../constants.dart';
import 'package:get/get.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({
    Key? key,
    required this.onChanged,
    this.initValue,
  }) : super(key: key);
  final FormFieldSetter<String>? onChanged;
  final String? initValue;

  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  final ValueNotifier<String> genderNotifier =
      ValueNotifier<String>(genderKeys[0]);

  _GenderSelectorState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      genderNotifier.value = widget.initValue ?? genderKeys[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الجنس',
            ).addPaddingHorizontalVertical(horizontal: 6),
            const SizedBox(height: 10),
            ValueListenableBuilder<String>(
              valueListenable: genderNotifier,
              builder: (BuildContext context, String gender, _) => SizedBox(
                width: context.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: genderKeys.map((String e) {
                    final selected = e == gender;
                    return InkWell(
                      onTap: () {
                        genderNotifier.value = e;
                        if (widget.onChanged != null) widget.onChanged!(e);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F4FB),
                          border: Border.all(color: const Color(0xFFF3F7FF)),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(APP_BORDER_RADIUS)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Radio<String>(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              value: e,
                              groupValue: gender,
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
                    ).addPaddingHorizontalVertical(horizontal: 8);
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
