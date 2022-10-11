import 'package:flutter/material.dart';

import 'core/constants/constants.dart';
import 'models/data_table.dart';
import 'models/user_model.dart';

class TableUI extends StatefulWidget {
  const TableUI({
    this.onChanged,
    Key? key,
    this.items = const [],
  }) : super(key: key);
  final ValueChanged<bool>? onChanged;
  final List<UserModel> items;

  @override
  _TableUIState createState() => _TableUIState();
}

class _TableUIState extends State<TableUI> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          cardColor: Colors.white,
          textTheme: TextTheme(caption: TextStyle(color: Colors.black54))),
      child: PaginatedDataTable(
        header: Text("البيانات الجديده",
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.black54)),
        onRowsPerPageChanged: (perPage) {},
        rowsPerPage: 10,
        columns: tableHeader
            .map(
              (e) => DataColumn(
                label: Text(e,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.black54)),
                onSort: (columnIndex, ascending) {
                  print("$columnIndex $ascending");
                },
              ),
            )
            .toList(),
        source: TableRow(widget.items, context),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<UserModel> items;
  final BuildContext context;

  @override
  DataRow? getRow(int index) {
    UserModel item = items[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("${item.nationalId}", style: tableDataStyle)),
      DataCell(Text("${item.address}", style: tableDataStyle)),
      DataCell(Text("${item.personalStatus}", style: tableDataStyle)),
      DataCell(Text("${item.husbandId}", style: tableDataStyle)),
      DataCell(Text("${item.socialStatus}", style: tableDataStyle)),
      DataCell(Text("${item.birthDate}", style: tableDataStyle)),
      DataCell(Text("${item.working}", style: tableDataStyle)),
      DataCell(Text("${item.healthStatus}", style: tableDataStyle)),
      DataCell(Text("${item.childrenNumber}", style: tableDataStyle)),
      DataCell(Text("${item.housing}", style: tableDataStyle)),
      DataCell(Text("${item.owning}", style: tableDataStyle)),
      DataCell(Text("${item.owning}", style: tableDataStyle)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;

  TableRow(this.items, this.context);
}
