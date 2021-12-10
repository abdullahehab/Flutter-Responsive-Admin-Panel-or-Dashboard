import 'package:admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(),
          SizedBox(height: defaultPadding),
        ],
      ),
    ));
  }
}
