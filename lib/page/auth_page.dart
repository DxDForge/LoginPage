
import 'package:auth/page/home_page.dart';
import 'package:auth/page/login_or_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if login
          if (snapshot.hasData) {
           return  HomePage(); 
          }else{
            return const LoginOrSignup(
              
            );
          }
        },
      ),
    );
  }
}