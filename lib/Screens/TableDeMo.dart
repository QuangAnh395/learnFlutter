import 'package:flutter/material.dart';
// hiển thị bảng có đường viền , căn chỉnh các ô

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  static const String _title = 'Table Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const TableStateLessWidget(),
      ),
    );
  }
}


class TableStateLessWidget extends StatelessWidget {
  const TableStateLessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      // cho vào giữa
      children: [TableRow(
        children: [
          Container(
            height: 32,
            color: Colors.green,
          ),
          TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            // cho lên trên
            child: Container(
              height: 32,
              width: 32,
              color: Colors.red,
            ),
          ),
          Container(
            height: 64,
            color: Colors.blue,
          ),
        ],
      ),],
    );
  }
}
