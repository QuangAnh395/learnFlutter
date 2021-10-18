import 'package:flutter/material.dart';
import 'package:flutter_training_kca/catalog_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'quang anh Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatalogScreen(),
    );
  }
}

class CatalogScreen extends StatelessWidget {
  final List<CatalogModel> _listCatalog = CatalogModel.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Catalog'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            CatalogModel model = _listCatalog[index];
            return InkWell(
              child: ListTile(
                title: Text(model.widgetName),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
              onTap: () async {
                await Future.delayed(const Duration(milliseconds: 200));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => model.destinationScreen));
              },
            );
          },
          itemCount: _listCatalog.length,
        ));
  }
}

class SafeAreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SafeAre'),
      ),
      body: const Center(
        child: Text('Content SafeAre'),
      ),
    );
  }
}
