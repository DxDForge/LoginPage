
import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:auth/components/my_tile.dart';
import 'package:auth/service/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class LogInPage extends StatefulWidget {
 final void Function() onTap;
  const LogInPage({super.key,required this.onTap});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {


  //method for sing in

  void signIng()async{

await FirebaseAuth.instance.signInWithEmailAndPassword(
  email: emailTextController.text, 
  password: passwordTextController.text,
  
  );
  }
  //text editing controller
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
               
                
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
            
                const SizedBox(
                  height: 25,
                ),
                //welcome
                const Text(
                  'wellcome back Dear, sing in here ',
                ),
            
                const SizedBox(
                  height: 50,
                ),
            
                //email
                MyTextField(
                    controller: emailTextController,
                    obscureText: false,
                    hintText: 'Email'),
                const SizedBox(
                  height: 5,
                ),
                //password
                MyTextField(
                    controller: passwordTextController,
                    obscureText: true,
                    hintText: 'password'),
            
            const SizedBox(height: 5,),
                //forget password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('forget password')],
                  ),
                ),
            const SizedBox(height: 25,),
                //login button
              MyButton(buttonName: 'sign In', onTap: signIng),
            

            const SizedBox(height: 20,),
                //dirvider//or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[400],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Or continue with'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            const SizedBox(height: 20,),
                //google or apple login
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google login
                    MyTile(location: 'lib/images/google.png',onTap: () => AuthServices().singInWithGoogle(),),
            SizedBox(width: 10,),
                    //apple login
            
                    MyTile(location: 'lib/images/apple2.png',onTap: () {
                      
                    },)
                  ],
                ),
            const SizedBox(height: 50,),
                //register now
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    const Text('Don\'t have any account? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
