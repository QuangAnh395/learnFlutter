import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ExpandedDeMo2 extends StatelessWidget{
  final double _width = 500;
  final double _height = 500;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DeMo Expanded2',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red),
              width: _width,
              height: _height,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.yellow),
                width: _width,
              ),
            ),
            Expanded(
              flex: 1 ,child: Text(DateFormat.yMMMd().format(DateTime.now())),)
          ],
        ),
      ),
    );
  }
}