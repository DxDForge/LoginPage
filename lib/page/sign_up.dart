
import 'package:auth/components/my_button.dart';
import 'package:auth/components/my_textfield.dart';
import 'package:auth/components/my_tile.dart';
import 'package:auth/service/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class SignUpPage extends StatefulWidget {
 final void Function() onTap;
  const SignUpPage({super.key,required this.onTap});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  //method for sing in

  void signUp()async{

      if (passwordTextController.text==confirmTextController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: emailTextController.text, 
        password: passwordTextController.text,
  
  );
      } else {
        showDialog(context: context, builder:(context) {
          // ignore: prefer_const_constructors
         return Center(
           child: const AlertDialog(
              title: Text('Password Don\'t match'),
            ),
         );
        },);
      }
  }
  //text editing controller
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmTextController=TextEditingController();


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
                  'wellcome back Dear, SIGN UP in here ',
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
                  const SizedBox(
                  height: 5,
                ),
                //confirm password
                   MyTextField(
                    controller: confirmTextController,
                    obscureText: true,
                    hintText: 'confirm password'),
            
          
            
           
            const SizedBox(height: 25,),
                //Signup button
              MyButton(buttonName: 'Sign Up', onTap: signUp),
            

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
                    MyTile(location: 'lib/images/google.png', onTap:() => AuthServices().singInWithGoogle(),),
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
                    const Text('Already have an account? '),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        ' Sign In',
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
