// 1 sliver đặt nhiều child theo cách sắp xếp 2 chiều
// slivergrid đặt các child của nó vào các vị trí tùy ý được xác định bởi GridDelegate
import 'package:flutter/material.dart';

void main() => runApp(const SliverGridScreen());

class SliverGridScreen extends StatelessWidget {
  const SliverGridScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: SliverGridStatefullWidget(),
    );
  }
}

class SliverGridStatefullWidget extends StatefulWidget {
  const SliverGridStatefullWidget({Key? key}) : super(key: key);

  @override
  State<SliverGridStatefullWidget> createState() => _SliverGridStatefullWidgetState();
}

// State riêng
class _SliverGridStatefullWidgetState extends State<SliverGridStatefullWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              // SliverGridDelegateWithMaxCrossAxisExtent tạo bố cục lưới với
              // các ô có phạm vi trục chéo tối đa
              maxCrossAxisExtent: 200.0,
              // mức độ tối đa của các ô trong trục chéo
              mainAxisSpacing: 10.0,
              // số lượng pixel hợp lý giữa mỗi con dọc theo trục chính- trục đứng
              crossAxisSpacing: 10.0,
              //Số lượng pixel hợp lý giữa mỗi con dọc theo trục chéo- trục ngang
              childAspectRatio: 4.0,
                //Tỷ lệ giữa trục chéo và trục chính của mỗi child , giao 2 trục 
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}

