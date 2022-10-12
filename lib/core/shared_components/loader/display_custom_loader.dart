import 'package:admin/extensions/extension.dart';
import 'package:flutter/material.dart';

import 'circular_laod.dart';

const String _loaderRouteName = 'displayCustomCircular';

 displayCustomCircular(BuildContext context) async {

  Navigator.of(context).push(PageRouteBuilder<dynamic>(
    opaque: false,
    settings: const RouteSettings(name: _loaderRouteName),
    pageBuilder: (BuildContext context, _, __) =>
        CircularLoad().disableBackButton(),
  ));
}

void closeCustomCircular(BuildContext context) {
  Navigator.popUntil(
    context,
    (Route<dynamic> route) {
      return route.settings.name != _loaderRouteName;
    },
  );
}
