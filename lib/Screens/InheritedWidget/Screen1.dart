import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  final String name;
  Screen1(this.name);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(name),
    );
  }
}
