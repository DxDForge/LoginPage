


import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{
   singInWithGoogle()async{
    // open interactive sing in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth =await gUser!.authentication;

    //create a new credential for user

    final credential =GoogleAuthProvider.credential(
      idToken: gAuth.idToken,
      accessToken: gAuth.accessToken,
    );


    //finaly , lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}