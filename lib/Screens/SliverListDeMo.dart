// thanh appbar khi màn hình kéo xuống sẽ nhỏ dần, và luôn luôn hiển thị appBar
/// Flutter code sample for SliverAppBar

import 'package:flutter/material.dart';

void main() => runApp(const SliverListScreen());

class SliverListScreen extends StatelessWidget {
  const SliverListScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: SliverListStatefullWidget(),
    );
  }
}

class SliverListStatefullWidget extends StatefulWidget {
  const SliverListStatefullWidget({Key? key}) : super(key: key);

  @override
  State<SliverListStatefullWidget> createState() => _SliverListStatefullWidgetState();
}

// State riêng
class _SliverListStatefullWidgetState extends State<SliverListStatefullWidget> {
  // SliverAppBar thường được dùng trong customScrollView
  // có thể được đặt trong Scaffold.body
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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

