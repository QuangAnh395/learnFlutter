import 'package:flutter/material.dart';
import 'object_select.dart';
import 'object_user.dart';

class ScreenLogic {
  TextEditingController accountController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController lastPasswordController = TextEditingController();
  List<int> _listIndex = [];
  List<SelectObject> _listObject = [
    SelectObject(
        title: "Premier League",
        imageUrl:
            "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2016/08/premier_league_rebrands_designstudio_01.jpg"),
    SelectObject(
        title: "Laliga",
        imageUrl:
            "https://iscreativestudio.com/wp-content/uploads/2016/08/logotipos4.jpg"),
    SelectObject(
        title: "Bundesliga",
        imageUrl:
            "https://i.pinimg.com/originals/6b/a3/18/6ba318474e4cab7cef32a965fd6b982c.png"),
    SelectObject(
        title: "Ligue 1",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Ligue_1_Uber_Eats.svg/1200px-Ligue_1_Uber_Eats.svg.png"),
    SelectObject(
        title: "Seria A",
        imageUrl:
            "https://static.wikia.nocookie.net/logopedia/images/0/02/Serie_A_logo_%282018%29.png/revision/latest?cb=20180729083244"),
  ];
  List<SelectObject> _listObjectLike = [
    SelectObject(
        title: "Manchester United",
        imageUrl:
            "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2016/08/premier_league_rebrands_designstudio_01.jpg"),
    SelectObject(
        title: "Manchester City",
        imageUrl:
            "https://iscreativestudio.com/wp-content/uploads/2016/08/logotipos4.jpg"),
    SelectObject(
        title: "Chelsy",
        imageUrl:
            "https://i.pinimg.com/originals/6b/a3/18/6ba318474e4cab7cef32a965fd6b982c.png"),
    SelectObject(
        title: "Arsenal",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Ligue_1_Uber_Eats.svg/1200px-Ligue_1_Uber_Eats.svg.png"),
    SelectObject(
        title: "Liverpool",
        imageUrl:
            "https://static.wikia.nocookie.net/logopedia/images/0/02/Serie_A_logo_%282018%29.png/revision/latest?cb=20180729083244"),
  ];
  ObjectUsers user = ObjectUsers();
  bool availableSecurity() {
    String email = emailController.text;
    String password = passwordController.text;
    String lastPass = lastPasswordController.text;
    if (email.isNotEmpty &&
        password.isNotEmpty &&
        lastPass.isNotEmpty &&
        password == lastPass) {
      user.email = email;
      user.password = password;
      return true;
    }
    return false;
  }

  bool availableCreate() {
    String account = accountController.text;
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    if (account.isNotEmpty && firstName.isNotEmpty && lastName.isNotEmpty) {
      user.account = account;
      user.firstname = firstName;
      user.lastname = lastName;
      return true;
    }
    return false;
  }

  void chooseLeague(SelectObject selectedObject) {
    user.leagueObject = selectedObject;
  }

  void chooseTeam(SelectObject selectedObjectTeam) {
    user.teamObject = selectedObjectTeam;
  }

  List<SelectObject> getListObject() {
    return _listObject;
  }

  List<SelectObject> getListObjectLike() {
    return _listObjectLike;
  }
}
