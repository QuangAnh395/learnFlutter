

import 'package:flutter/material.dart';

class WrapDeMo extends StatefulWidget{
  @override
  State<WrapDeMo> createState() => _WrapDeMoState();

}
class _WrapDeMoState extends State<WrapDeMo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wrap',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.red),

        ),
      ),
      body: Wrap(
        alignment: WrapAlignment.end,
        spacing: 30.0,
        runSpacing: 20.0,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red),
            width: 100,
            height: 100,
            child: Text(
              'Box1',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            width: 100,
            height: 100,
            child: Text(
              'Box2',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            width: 100,
            height: 100,
            child: Text(
              'Box3',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            width: 100,
            height: 100,
            child: Text(
              'Box4',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.red),
            width: 100,
            height: 100,
            child: Text(
              'Box5',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],

      ),
    );
  }
}