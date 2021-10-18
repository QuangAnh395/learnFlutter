import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_kca/Screens/Login/LoginLogic.dart';

class LoginScreenDeMO extends StatelessWidget {
  const LoginScreenDeMO({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20), // lề lùi vào 20
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // late LoginLogic loginLogic;  tương đương với : LoginLogic loginLogic =LoginLogic();
  // khởi tạo
  late LoginLogic loginLogic;
  @override
  void initState() {
    loginLogic = LoginLogic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: loginLogic.accountController,
                  onChanged: (text) {
                    loginLogic.availableLogin();
                    },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined,),
                    labelText: "tài khoản",
                    hintText: "Tài Khoản",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 42,
                      vertical: 20,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),

                  ),

                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: loginLogic.passWordController,
                  obscureText: loginLogic.obscureText,
                  onChanged: (text) {
                    loginLogic.availableLogin();
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    labelText: "PassWord",
                    hintText: "PassWord",
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 42,
                      vertical: 20,
                    ),
                    suffixIcon: IconButton(
                      icon: loginLogic.obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                      onPressed: (){
                       setState(() {
                         loginLogic.toggleVisiblePassword();
                       });
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),

                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                            onPressed: loginLogic.isNotEmpty ? (

                                ) {} : null,
                            // style: ElevatedButton.styleFrom(
                            //   primary: _isNotEmpty ? Colors.blue : Colors.grey,
                            // ),
                            //   onPressed: (){
                            //
                            //   },style chỉ thay đổi màu nhưng vẫn click được còn onpress thì không click được
                            //child: Text("Đăng Nhập")),
                      child: Text("Đăng Nhập")
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
