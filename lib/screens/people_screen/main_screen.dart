import 'package:admin/models/side_menu_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MainView extends StatefulWidget {
  const MainView(this.item, {Key? key}) : super(key: key);
  final MenuItems item;

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Container(alignment: Alignment.center, child: widget.item.itemWidget),
    );
  }
}
