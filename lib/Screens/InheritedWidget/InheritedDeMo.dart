// widget nào đăng ký InheritedWidget
// sử dụng data ở những widget con nào


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widget đăng ký InheritedWidget
class InheritedScreen extends StatelessWidget {
  const InheritedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InheritedWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        centerText:CenterText2(),
      ),
    );
  }
}
// tạo InheritedWidget
class MyInheritedWidget extends InheritedWidget {
  // lưu trữ dữ liệu
  const MyInheritedWidget(Widget child, this.myData) : super(child: child);
  final int myData;
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }


  @override
  bool updateShouldNotify(MyInheritedWidget old) {
    print('updateShouldNotify $myData - ${old.myData}');
    return true;
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.centerText}) : super(key: key);
  final Widget centerText;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter =0 ;

  void _incrementCounter(){
    setState(() {
      _counter++;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'InheritedWidget Screen',
        ),
      ),
      // khởi tạo MyInheritedWidget, widget nào đăng kí InheritedWidget
      body: MyInheritedWidget(Column(children: [widget.centerText, DeMoData()],),_counter ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
class CenterText2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
   print('CenterTextState creatState');
   return CenterTextState();
  }
}

class CenterTextState extends State<CenterText2> {
  @override
  Widget build(BuildContext context) {
    print('CenterTextState build');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('you have push the button this many time'),
          Text('${MyInheritedWidget.of(context)!.myData}'),
        ],
      ),
    );
  }
}
class DeMoData extends StatelessWidget {
  const DeMoData({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // khởi tạo, truy vấn đến data
    MyInheritedWidget? instance = MyInheritedWidget.of(context);
    return Container(
      color: Colors.redAccent,
      child: Text('Data is ${instance!.myData}'),
    );
  }
}

