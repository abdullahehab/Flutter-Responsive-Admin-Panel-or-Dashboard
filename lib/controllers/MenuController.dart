import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  int _selectedMenuIndex = 0;
  int get selectedMenuIndex => _selectedMenuIndex;
  set setSelectedMenuIndex(int newVlu) {
    _selectedMenuIndex = newVlu;
    notifyListeners();
  }
}
