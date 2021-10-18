// pageview nó tạo ra văn bản ở giữa trong mỗi trang trong số 3 trang
// cuộn theo chiều ngang
import 'package:flutter/material.dart';

void main() => runApp(const PageViewScreen());

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  static const String _title = 'Page View Screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const PageViewWidget(),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return PageView(
      scrollDirection: Axis.horizontal, // cuộn theo chiều ngang
      // scrollDirection: Axis.vertical cuộn theo chiều dọc
      controller: controller,
      children: const <Widget>[
        Center(
          child: Text('First Page'),
        ),
        Center(
          child: Text('Second Page'),
        ),
        Center(
          child: Text('Third Page'),
        )
      ],
    );
  }
}
