// load ảnh
import 'package:flutter/material.dart';
class FadeInImageScreen extends StatelessWidget {
  const FadeInImageScreen({Key? key}) : super(key: key);
  final _title = "Fade In Image";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),

      ),
    );
  }
}

