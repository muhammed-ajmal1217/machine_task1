import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier{
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool remeberMe = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;
  rememberMe(value){
    remeberMe=value??false;
    notifyListeners();
  }
  validateEmail(String value) {
    isEmailValid = formKey1.currentState?.validate() ?? false;
    notifyListeners();
  }

  validatePassword(String value) {
    isPasswordValid = formKey2.currentState?.validate() ?? false;
    notifyListeners();
  }
}