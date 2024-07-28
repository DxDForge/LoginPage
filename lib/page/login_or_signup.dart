import 'package:auth/logIn.dart';
import 'package:auth/page/sign_up.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginOrSignup extends StatefulWidget {
 const  LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  // default page
  bool showLoginPage = true;

  //toggle between pages
  void togglePage(){
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
     if (showLoginPage) {
      return LogInPage(onTap: togglePage);
    }else{
      return SignUpPage(onTap: togglePage,);
    }
  }
}