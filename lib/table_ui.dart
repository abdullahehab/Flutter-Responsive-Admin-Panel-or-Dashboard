import 'package:flutter/material.dart';

import 'constants.dart';
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
      data: Theme.of(context).copyWith(cardColor: bgColor),
      child: PaginatedDataTable(
        header: Text("البيانات الجديده",
            style: Theme.of(context).textTheme.subtitle1),
        onRowsPerPageChanged: (perPage) {},
        rowsPerPage: 10,
        columns: tableHeader
            .map(
              (e) => DataColumn(
                label: Text(e),
                onSort: (columnIndex, ascending) {
                  print("$columnIndex $ascending");
                },
              ),
            )
            .toList(),
        source: TableRow(widget.items),
      ),
    );
  }
}

class TableRow extends DataTableSource {
  final List<UserModel> items;

  @override
  DataRow? getRow(int index) {
    print('index => $index');
    UserModel item = items[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("${item.nationalId}")),
      DataCell(Text("${item.address}")),
      DataCell(Text("${item.personalStatus}")),
      DataCell(Text("${item.husbandName}")),
      DataCell(Text("${item.socialStatus}")),
      DataCell(Text("${item.birthDate}")),
      DataCell(Text("${item.working}")),
      DataCell(Text("${item.healthStatus}")),
      DataCell(Text("${item.childrenNumber}")),
      DataCell(Text("${item.housing}")),
      DataCell(Text("${item.owning}")),
      DataCell(Text("${item.owning}")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => items.length;

  @override
  int get selectedRowCount => 0;

  TableRow(this.items);
}
