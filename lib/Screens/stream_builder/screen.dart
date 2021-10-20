import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_kca/Screens/stream_builder/model/user.dart';
import 'package:flutter_training_kca/Screens/stream_builder/screen_logic.dart';

import 'component/user_list.dart';
import 'package:http/http.dart' as http;

class MainStreamScreen extends StatefulWidget {
  const MainStreamScreen({Key? key}) : super(key: key);

  @override
  _MainStreamScreenState createState() => _MainStreamScreenState();
}

class _MainStreamScreenState extends State<MainStreamScreen> {
  StreamScreenLogic screenLogic = StreamScreenLogic();
  List<User> userList = [];
  late Stream<List<User>>? _listUserStream;

  @override
  void initState() {
    _listUserStream = (() async* {
      await Future.delayed(Duration(seconds: 10));
      userList = await getListOfUser(http.Client());
      yield userList;
    })();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trang chủ"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
        ),
        padding: EdgeInsets.only(top: 10),
        child: StreamBuilder<List<User>>(
          stream: _listUserStream
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            Widget child = Center(child: CircularProgressIndicator());
            if (snapshot.hasError) {
              print("Snapshot Error: ${snapshot.error}");
              print("Snapshot Stacktrace: ${snapshot.stackTrace}");
              child = Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
              );
            } else if (snapshot.hasData) {
              child = UsersList(userList: snapshot.data!);
            }
            return Container(
              child: child,
            );
          },
        ),
      ),
    );
  }
}

Future<List<User>> getListOfUser(http.Client client) async {
  final response = await client.get(Uri.parse(
      "https://api.github.com/search/repositories?q=trending&sort=start"));
  return parseUser(response.body);
}

List<User> parseUser(String responseBody) {
  final parsed = jsonDecode(responseBody);
  return parsed["items"].map<User>((json) => User.fromJson(json)).toList();
}
