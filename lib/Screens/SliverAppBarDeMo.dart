// thanh appbar khi màn hình kéo xuống sẽ nhỏ dần, và luôn luôn hiển thị appBar
/// Flutter code sample for SliverAppBar

import 'package:flutter/material.dart';

void main() => runApp(const SliverAppBarScreen());

class SliverAppBarScreen extends StatelessWidget {
  const SliverAppBarScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: SliverAppBarStatefulWidget(),
    );
  }
}

class SliverAppBarStatefulWidget extends StatefulWidget {
  const SliverAppBarStatefulWidget({Key? key}) : super(key: key);

  @override
  State<SliverAppBarStatefulWidget> createState() => _SliverAppBarStatefulWidgetState();
}

// State riêng
class _SliverAppBarStatefulWidgetState extends State<SliverAppBarStatefulWidget> {
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  // SliverAppBar thường được dùng trong customScrollView
  // có thể được đặt trong Scaffold.body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: 160.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('SliverAppBar'),
              background: FlutterLogo(),
            ),
            // FlexibleSpcaeBar tiện ích này được xếp sau thanh công cụ, thanh tap
            // chiều cao của nó sẽ giống chiều cao tổng thể của thanh ứng dụng
          ),
          // SliverList đặt nhiều ô con trong 1 mảng
          SliverList(
            delegate: SliverChildBuilderDelegate(
              // SliverChildBuilderDelegate cung cấp con con sliver
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  // isOdd số nguyên lớn là số lẻ
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,// số child cần
            ),
          ),
        ],
      ),
    );
  }
}

