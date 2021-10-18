import 'package:flutter/material.dart';

class OpacityDeMoScreen extends StatelessWidget {
  const OpacityDeMoScreen({Key? key}) : super(key: key);
  static const String _title = 'Opacity DeMo';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const OpacityDeMo(),
      ),
    );
  }
}
class OpacityDeMo extends StatefulWidget {
  const OpacityDeMo({Key? key}) : super(key: key);

  @override
  _OpacityDeMoState createState() => _OpacityDeMoState();
}

class _OpacityDeMoState extends State<OpacityDeMo> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _visible = !_visible;
          });
        },
        tooltip: "Toggle Opacity",
        child: Icon(Icons.flip),
      ),

    );
  }
}



