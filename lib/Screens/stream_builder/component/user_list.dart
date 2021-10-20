import 'package:flutter/material.dart';
import 'package:flutter_training_kca/Screens/stream_builder/component/user_card.dart';
import 'package:flutter_training_kca/Screens/stream_builder/model/user.dart';

class UsersList extends StatelessWidget {
  final List<User> userList;

  UsersList({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (_, index) {
          String? imgUrl = userList[index].owner?.avatarUrl ?? "";
          String fullName = userList[index].fullName ?? "";
          return UserCard(
            imgUrl: imgUrl,
            fullName: fullName,
          );
        });
  }
}
