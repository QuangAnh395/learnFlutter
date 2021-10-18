import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpandedDemo extends StatelessWidget{
  final double _width = 50;
  final double _height = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expanded',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.yellow),
              width: _width,
              height: _height,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.black),
                height: _height,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                height: _height,
              ),
            ),
            Expanded(
              flex:1 ,child: Text(DateFormat.yMMMd().format(DateTime.now())),)
          ],
        ),
      ),
    );
  }
}