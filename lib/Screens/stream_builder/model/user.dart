
import 'package:flutter_training_kca/Screens/stream_builder/model/owner.dart';

class User{
  int? id;
  String? fullName;
  String? name;
  Owner? owner;
  User({this.id, this.fullName, this.name, this.owner});
  factory User.fromJson(Map<String, dynamic> json){
    int id = json["id"] ?? 0;
    String name = json["name"] ?? "";
    String fullName = json["full_name"];
    Owner owner = Owner.fromJson(json["owner"]);
    return User(id: id, name: name, fullName: fullName, owner: owner);
  }

}