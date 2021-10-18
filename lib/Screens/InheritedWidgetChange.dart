import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  return  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: TheStatefulWidget(
            child: TheContainer(
              child:  TheStackWidget(),
            ),

          )
      ),
    );
  }
}

class TheStatefulWidget extends StatefulWidget {
  final Widget child;
  TheStatefulWidget({Key? key, required this.child}):super(key: key);
  static TheStatefulWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TheInheritedWidget>()!.data;
  }
  @override
  TheStatefulWidgetState createState() => TheStatefulWidgetState();
}

class TheStatefulWidgetState extends State<TheStatefulWidget> {
  bool _changed = false;
  bool get changed => _changed;

  changeColor(){
    setState(() {
      _changed = !_changed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TheInheritedWidget(
        child: widget.child,
        data: this, );
  }
}
class TheInheritedWidget extends InheritedWidget{

  final TheStatefulWidgetState data;

  TheInheritedWidget({
    required Widget child,
    required this.data
  }) : super( child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
class TheContainer extends StatelessWidget {
  final Widget child;
  TheContainer({Key? key, required this.child}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
class TheStackWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Stack(
        children: [
          ColorBox(),
          LableBox()
        ],
      ),
    );
  }


}
class LableBox extends StatefulWidget {
  @override
  _LableBoxState createState() => _LableBoxState();
}
class _LableBoxState extends State<LableBox> {
  late bool changed;
  @override
  void didChangeDependencies() {
    TheStatefulWidgetState data = TheStatefulWidget.of(context);
    changed = data.changed;
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return changed ? Text("Màu Đỏ", style: TextStyle(
        color: Colors.blue
    ),) : Text("Màu Xanh", style: TextStyle(
        color: Colors.white
    ),);
  }
}

class ColorBox extends StatefulWidget {
  @override
  _ColorBoxState createState() => _ColorBoxState();
}

class _ColorBoxState extends State<ColorBox> {
  late bool changed ;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    TheStatefulWidgetState data = TheStatefulWidget.of(context);
    changed = data.changed;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: changed ? Colors.red: Colors.blue
        ),
      ),
      onTap: (){
        // Use function of parentWidget - TheStatefulWidget
        TheStatefulWidget.of(context).changeColor();
      },
    );
  }
}