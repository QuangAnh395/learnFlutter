
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_kca/Screens/DeMoListLikeFoodBall/pageview_controller.dart';






class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Flexible(
                flex: 5,
                child: Center(
                  child: Text(
                    "Chào Mừng",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text("Đăng ký email"),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                      child: Text(
                        "or",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text("Đăng ký với Apple"),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Đăng ký với facebook"),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PageViewWidget()));
                      },

                      child: Text(
                        "Đăng nhập",
                        style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Text(
                      " Bằng cách tiếp tục, bạn đồng ý với Foot's  Điều khoản dịch vụ và chính sách quyền riêng tư", textAlign: TextAlign.center,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
