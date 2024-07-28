import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
//


final userName = FirebaseAuth.instance.currentUser!;


void onPressed(){
  FirebaseAuth.instance.signOut();
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(actions: 
      [IconButton(
        onPressed: onPressed, 
        icon: Icon(Icons.logout),
        
        )],),
    
      body:  Center(
        child: Text('You are logged in : '+userName.email!,style: TextStyle(fontSize: 20),),
      ),
    );
  }
}