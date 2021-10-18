import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_kca/Screens/DeMoListLikeFoodBall/object_user.dart';

import 'logic.dart';
import 'object_select.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  ScreenLogic screenLogic = ScreenLogic();
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back_ios_outlined),
                          onPressed: () {
                            if (controller.page == 0) {
                              Navigator.pop(context);
                            } else {
                              controller.previousPage(
                                  duration: Duration(microseconds: 100),
                                  curve: Curves.bounceIn);
                            }
                            //controller.previousPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn);
                          }),
                      //Icon(Icons.arrow_back_ios_outlined),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      buildCreateAccount(),
                      buildSecurityPage(),
                      buildChooseLeague(),
                      buildChooseTeam(),
                      buildRegistration(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCreateAccount() => Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              " Tạo tài khoản",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: screenLogic.accountController,
              decoration: InputDecoration(
                hintText: "Tên người dùng",
              ),
            ),
            TextField(
              controller: screenLogic.firstNameController,
              decoration: InputDecoration(hintText: "Họ"),
            ),
            TextField(
              controller: screenLogic.lastNameController,
              decoration: InputDecoration(
                hintText: "Tên",
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bool isValidate = screenLogic.availableCreate();
                  if (isValidate) {
                    controller.jumpToPage(1);
                  } else {
                    // if 1 textfield is empty
                  }
                  // chuyển trang bằng index
                },
                child: Text("Tiếp Theo"),
              ),
            )
          ],
        ),
      );
  buildSecurityPage() => Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              " Nâng cao bảo mật",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: screenLogic.emailController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            TextField(
              controller: screenLogic.passwordController,
              decoration: InputDecoration(hintText: "Nhập mật khẩu"),
            ),
            TextField(
              controller: screenLogic.lastPasswordController,
              decoration: InputDecoration(
                hintText: "Nhập lại mật khẩu",
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bool isAvailableS = screenLogic.availableSecurity();
                  if (isAvailableS) {
                    controller.jumpToPage(2);
                  } else {
                    print("chua du yeu cau");
                  }
                  // controller.previousPage(duration: Duration(seconds: 1), curve: Curves.bounceIn); : trở lại màn hình trước
                },
                child: Text("Tiếp Theo"),
              ),
            )
          ],
        ),
      );
  buildChooseLeague() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Chọn giải đấu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
                flex: 8,
                child: ListView.builder(
                  itemCount: screenLogic.getListObject().length,
                  itemBuilder: (BuildContext context, int index) {
                    SelectObject selectObject = screenLogic.getListObject()[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          screenLogic.chooseLeague(selectObject);
                          controller.jumpToPage(3);
                        });
                      },
                      child: _selectCard(selectObject), // listObject[index]
                    );
                  },
                )),
          ],
        ),
      );
  buildChooseTeam() => Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chọn đội yêu thích",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 8,
              child: ListView.builder(
                itemCount: screenLogic.getListObjectLike().length,
                itemBuilder: (BuildContext context, int index) {
                  SelectObject selectedObjectTeam =
                      screenLogic.getListObjectLike()[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        screenLogic.chooseTeam(selectedObjectTeam);
                        controller.jumpToPage(4);
                      });
                    },
                    child: _selectCard(selectedObjectTeam), // listObject[index]
                  );
                },
              )),
        ],
      ));
  buildRegistration() => Container(
        child: Column(
          children: [
            Flexible(
              flex: 7,
              child: Image.network(
                  "https://image.thanhnien.vn/1024/uploaded/hoangnam/2020_08_24/01_esvt.jpg"),
            ),
            Flexible(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Tong hop"),
                      content: Column(children: [
                        Text(screenLogic.user.account!),
                        Text(screenLogic.user.firstname!),
                        Text(screenLogic.user.lastname!),
                        Text(screenLogic.user.email!),
                        Text(screenLogic.user.password!),
                        _selectCard(screenLogic.user.leagueObject!),
                        _selectCard(screenLogic.user.teamObject!),
                      ],),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop("yes");
                            },
                            child: Text("Ok")),
                      ],
                    );
                  });
                },
                child: Text("Đăng ký"),
              ),
            ),
          ],
        ),
      );
}

Container _selectCardLike(SelectObject selectObjectTeam) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              selectObjectTeam.imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 8,
          child: ClipRRect(
            child: Text(selectObjectTeam.title),
          ),
        ),
      ],
    ),
  );
}

Container _selectCard(SelectObject selectObject) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              selectObject.imageUrl,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 8,
          child: ClipRRect(
            child: Text(selectObject.title),
          ),
        ),
      ],
    ),
  );
}

