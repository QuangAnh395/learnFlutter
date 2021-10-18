import 'package:flutter/cupertino.dart';
import 'package:flutter_training_kca/Screens/DeMoList/ObjectList.dart';
import 'package:flutter_training_kca/Screens/DeMoList/SelectLogic.dart';

import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  SelectLogic selectLogic = SelectLogic();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back_outlined),
                          Text(
                            "Tiếp theo",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Tạo tài khoản",
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
                    itemCount: selectLogic.getListObject().length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectLogic.add(index);
                          });
                        },
                        child: _selectCard(selectLogic
                            .getListObject()[index]), // listObject[index]
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

Container _selectCard(SelectObject selectObject) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 15),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: selectObject.isSelected
                ? Icon(
                    Icons.check_circle_outline,
                    color: Colors.lightGreenAccent,
                    size: 70,
                  )
                : Image.network(
                    selectObject.imageUrl,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Flexible(
            flex: 8,
            child: ClipRRect(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  selectObject.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )),
      ],
    ),
  );
}
