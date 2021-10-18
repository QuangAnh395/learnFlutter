import 'package:flutter/material.dart';
// nút hành động nổi

void main() => runApp(const FabDemoScreen());

class FabDemoScreen extends StatelessWidget {
  const FabDemoScreen({Key? key}) : super(key: key);

  static const String _title = 'Floating Action Button';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button'),
      ),
      body: const Center(child: Text('Floating Action Button DeMo')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          count ++;
          print('ban click lan thu: ${count}');
        },
        child: const Icon(Icons.navigation),
        backgroundColor: Colors.green,
      ),
    );
  }
}
