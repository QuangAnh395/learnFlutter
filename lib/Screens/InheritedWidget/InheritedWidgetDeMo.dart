import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({required Widget child, required this.myData}) : super(child: child);
  final int myData;

  static MyInheritedWidget of(BuildContext context) {
    final MyInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
    assert(result != null, 'No MyInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    return false;
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // khởi tạo MyInheritedWidget tại vị trí cha của cả MyCenterWidget và MyText
      body: MyInheritedWidget(
        child: MyCenterWidget(), // child là sub tree từ MyCenterWidget xuống
        myData: count, // data cần chia sẻ cho mấy widget child chính là counter
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(),
    );
  }
}
// thậm chí xóa luôn constructor và data khai báo trong MyText
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Nhờ hàm MyInheritedWidget.of ta sẽ get được data
    // Bởi vì hàm of là hàm static nên ta có thể gọi ở bất cứ widget con nào ta muốn
    final count = MyInheritedWidget.of(context).myData;

    // get được data thì update UI thôi :D
    return Text('Tui là widget Text. Data của tui hiện tại là: $count');
  }
}
