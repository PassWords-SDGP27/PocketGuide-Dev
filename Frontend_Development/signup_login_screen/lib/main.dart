import 'package:flutter/material.dart';
import 'package:signup_login/screen/login_sign.dart';

void main() {
  runApp(LoginSignUpUi());
}

class LoginSignUpUi extends StatelessWidget {
  const LoginSignUpUi({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login SignUp UI",
      home: LoginSignUpScreen(),
    );
  }
}

