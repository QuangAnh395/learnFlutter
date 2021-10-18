
import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerScreen extends StatelessWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);
  static const String _title = 'AnimatedContainer Screen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
        ),
        body: const AnimateContainerDeMo(),
      ),
    );
  }
}

class AnimateContainerDeMo extends StatefulWidget {
  const AnimateContainerDeMo({Key? key}) : super(key: key);

  @override
  _AnimateContainerDeMoState createState() => _AnimateContainerDeMoState();
}

class _AnimateContainerDeMoState extends State<AnimateContainerDeMo> {

  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
          duration: Duration(seconds: 2),

          curve: Curves.fastOutSlowIn,

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final random = Random();
            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();
            _color = Color.fromARGB(random.nextInt(256), random.nextInt(256),
                random.nextInt(256), 1);
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
        tooltip: "Animate Container",
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

