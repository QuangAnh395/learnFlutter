
import 'package:flutter/cupertino.dart';

class LoginLogic {
  TextEditingController accountController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  bool _obscureText = true;
  bool _isNotEmpty = false;
  bool get obscureText => _obscureText;
  bool get isNotEmpty => _isNotEmpty;
  void availableLogin(){
    if(accountController.text.isNotEmpty && passWordController.text.isNotEmpty){
      _isNotEmpty = true;
    }else{
      _isNotEmpty = false;
    }
  }
  void toggleVisiblePassword(){
    // obscureText = true;
    _obscureText = !_obscureText;
    // obscureText = false; và người lại
    // vd click icon để hiển thị mật khẩu hay không
  }
}