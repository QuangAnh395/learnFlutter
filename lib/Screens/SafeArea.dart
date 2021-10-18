import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SafeAreaDeMo extends StatefulWidget{
  @override//crS
  State<StatefulWidget> createState() {
    return _SafeAreaDeMoState();
  }
}

class _SafeAreaDeMoState extends State<SafeAreaDeMo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            'Safe Area',
          ),
        ),
      ),
      body: SafeArea(
        //
        top: true,
        bottom: true,
        minimum: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              child: Text(
                'Safe DeMo',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              child: Text(
                'Safe Area Demo',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}